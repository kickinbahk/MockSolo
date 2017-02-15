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
      let tabBarController = segue.destination as! UITabBarController
      let draftPicksController = tabBarController.viewControllers?[1] as! DraftPicksTableViewController
      let positionToBeAdded = selectedPlayer.eligiblePositions[selectedIndex]
      var counter = 0
      var finishedCounter: Int?
      print(positionToBeAdded)
      var roster = draftPicksController.positions.availablePositions
      let positionCheck = draftPicksController.positions.checkPosition(isOpen: positionToBeAdded)
      
      if !positionCheck {
        print("no available positions")
        let alertController = UIAlertController(title: "Position Filled",
                                                message: "You have already drafted a player for all available \(positionToBeAdded) positions", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
      } else {
        print("Recieved: \(roster)")
        for position in roster {
          for (key, value) in position {
            if key == positionToBeAdded && value.isEmpty {
              finishedCounter = counter
            }
          }
          counter += 1
        }
        
        if let count = finishedCounter {
          print(count)
          roster[count].updateValue(selectedPlayer.name, forKey: positionToBeAdded)
          print(" Sent: \(roster)")
        }
        DraftManager.sharedInstance.removePreviousPlayers()
        draftPicksController.positions.availablePositions = roster
      }
    }
  }
  
  func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func updateUI() {
    let positions = selectedPlayer.eligiblePositions
    let margins = popUpView.layoutMarginsGuide
    let positionSegmentedControl = UISegmentedControl(items: positions)
   
    popUpView.backgroundColor = PopUpViewProps.blueGray
    popUpView.layer.cornerRadius = PopUpViewProps.radius
    popUpView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
    
    closeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    if let closeImage = UIImage(named: "clear_btn") {
      closeButton.setImage(closeImage, for: [])
    }
    
    playerNameLabel.text = selectedPlayer.name
    playerNameLabel.textColor = .white
    playerNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
    playerNameLabel.sizeToFit()
    
    // promptLabel.preferredMaxLayoutWidth = popUpView.bounds.width - 20
    promptLabel.text = NSLocalizedString("What position would you like to add this player to?",
                                    comment: "Position Pop Up Prompt")
    promptLabel.textColor = .white
    promptLabel.font = UIFont(name: promptLabel.font.fontName, size: 15)
    promptLabel.numberOfLines = 2
    
    positionSegmentedControl.frame = CGRect(x: 0,
                                            y: popUpView.bounds.height - 46,
                                            width: popUpView.bounds.width - 10,
                                            height: 44)
    positionSegmentedControl.tintColor = .white
    positionSegmentedControl.addTarget(self,
                                       action: #selector(PositionSelectionViewController.positionSelected),
                                       for: .valueChanged)
    positionSegmentedControl.sizeToFit()
    positionSegmentedControl.apportionsSegmentWidthsByContent = true
    
    popUpView.addSubview(playerNameLabel)
    popUpView.addSubview(promptLabel)
    popUpView.addSubview(closeButton)
    popUpView.addSubview(positionSegmentedControl)
    
    popUpView.translatesAutoresizingMaskIntoConstraints = false
    popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    popUpView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
    popUpView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                      constant: -(view.bounds.height / 2)).isActive = true
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -5).isActive = true
    closeButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 5).isActive = true
    
    playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
    playerNameLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
    playerNameLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true

    promptLabel.translatesAutoresizingMaskIntoConstraints = false
    promptLabel.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
    promptLabel.bottomAnchor.constraint(greaterThanOrEqualTo: positionSegmentedControl.topAnchor,
                                        constant: -20).isActive = true
    promptLabel.widthAnchor.constraint(equalTo: popUpView.widthAnchor, constant: -20).isActive = true
    
    positionSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
    positionSegmentedControl.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
    positionSegmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 5).isActive = true
    positionSegmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor,
                                                       constant: -5).isActive = true
  }
  
  func positionSelected(_ sender: UISegmentedControl) {
    selectedIndex = sender.selectedSegmentIndex
    performSegue(withIdentifier: "DraftPlayer", sender: sender)
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
