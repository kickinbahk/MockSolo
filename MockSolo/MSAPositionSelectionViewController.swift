//
//  MSAPositionSelectionViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/12/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class PositionSelectionViewController: UIViewController {
  var isPopUp = false
  var selectedIndex: Int = 0
  var selectedPlayer: Player! {
    didSet {
      if isViewLoaded {
        updateUI()
      }
    }
  }
  
  let playerNameLabel = UILabel()
  let promptLabel = UILabel()
  let popUpView = UIView()
  let closeButton = UIButton(type: .custom) as UIButton
  
  
  struct PopUpViewProps {
    static let radius: CGFloat = 10
    static let blueGray = UIColor(red: redness, green: greeness, blue: blueness, alpha: opacity)  // Hex: #7698B3
    
    static let redness: CGFloat = 46/255
    static let greeness: CGFloat = 60/255
    static let blueness: CGFloat = 70/255
    static let opacity: CGFloat = 0.95
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }
  
  override func viewDidLoad() {

    super.viewDidLoad()
    view.backgroundColor = UIColor.clear
    view.addSubview(popUpView)
    
    if isPopUp {
      let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
      gestureRecognizer.cancelsTouchesInView = false
      gestureRecognizer.delegate = self
      view.addGestureRecognizer(gestureRecognizer)
      
      if selectedPlayer != nil {
        updateUI()
        popUpView.layoutIfNeeded()
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "DraftPlayer" {
      let draftPicksController = segue.destination as! DraftPicksTableViewController
      let positionToBeAdded = selectedPlayer.eligiblePositions[selectedIndex]
      var counter = 0
      var finishedCounter: Int?
      print(positionToBeAdded)
      var roster = draftPicksController.positions.availablePositions
    
      for position in roster {
        for (key, value) in position {
          print(value)
          if key == positionToBeAdded && value.isEmpty {
            finishedCounter = counter
          }
        }
        counter += 1
      }
      
      if let count = finishedCounter {
        print(count)
        roster[count].updateValue(selectedPlayer.name, forKey: positionToBeAdded)

      }
        draftPicksController.positions.availablePositions = roster
    }
  }
  
  func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func updateUI() {
    let positions = selectedPlayer.eligiblePositions
    let margins = popUpView.layoutMarginsGuide
    let positionSegmentedControl = UISegmentedControl(items: positions)
    
    popUpView.frame = CGRect(x: 0, y: 0,
                             width: self.view.frame.width / 1.2,
                             height: self.view.frame.height - 400)
    popUpView.backgroundColor = PopUpViewProps.blueGray
    popUpView.layer.cornerRadius = PopUpViewProps.radius
    popUpView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
    
    closeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    if let closeImage = UIImage(named: "clear_btn") {
      closeButton.setImage(closeImage, for: [])
    }
    
    playerNameLabel.frame = CGRect(x: 0,
                                   y: 0,
                                   width: 10,
                                   height: 10)
    playerNameLabel.text = selectedPlayer.name
    playerNameLabel.textColor = .white
    playerNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
    playerNameLabel.sizeToFit()
    
    promptLabel.frame = CGRect(x: 15,
                               y: 40,
                               width: 300,
                               height: 30)
    promptLabel.preferredMaxLayoutWidth = popUpView.bounds.width - 20
    promptLabel.text = NSLocalizedString("What position would you like to add this player to?",
                                    comment: "Position Pop Up Prompt")
    promptLabel.textColor = .white
    promptLabel.lineBreakMode = .byWordWrapping
    promptLabel.numberOfLines = 2
    
    positionSegmentedControl.frame = CGRect(x: 0,
                                            y: popUpView.bounds.height - 46,
                                            width: popUpView.bounds.width - 10,
                                            height: 44)
    positionSegmentedControl.tintColor = .white
    positionSegmentedControl.addTarget(self,
                                       action: #selector(PositionSelectionViewController.positionSelected),
                                       for: .valueChanged)
    
    popUpView.addSubview(playerNameLabel)
    popUpView.addSubview(promptLabel)
    popUpView.addSubview(closeButton)
    popUpView.addSubview(positionSegmentedControl)
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
    closeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: -5).isActive = true
    
    playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
    playerNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
    playerNameLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true

    promptLabel.translatesAutoresizingMaskIntoConstraints = false
    promptLabel.topAnchor.constraint(equalTo: playerNameLabel.topAnchor, constant: 30).isActive = true
    promptLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
    promptLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
    
    positionSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    positionSegmentedControl.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    positionSegmentedControl.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -5).isActive = true

  }
  
  func positionSelected(_ sender: UISegmentedControl) {
    selectedIndex = sender.selectedSegmentIndex
    performSegue(withIdentifier: "DraftPlayer", sender: sender)
    
  }
  
  func addPositionButtonsToPopUp(_ positions: [String]) -> [UIButton] {
    var positionButtons = [UIButton]()
    for position in positions {
      let newButton = UIButton()
      newButton.setTitle(position, for: .normal)
      positionButtons.append(newButton)
    }
    return positionButtons
  }
  

  // MARK: - Navigation
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}

extension PositionSelectionViewController: UIViewControllerTransitioningDelegate {
  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
  }
}

extension PositionSelectionViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    return(touch.view == self.view)
  }
}
