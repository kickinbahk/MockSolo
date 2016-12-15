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
    
    popUpView.frame = CGRect(x: 0, y: 0,
                         width: self.view.frame.width / 1.5,
                         height: self.view.frame.height - 400)
    popUpView.backgroundColor = PopUpViewProps.blueGray
    popUpView.layer.cornerRadius = PopUpViewProps.radius
    popUpView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
    view.addSubview(popUpView)
    
    closeButton.frame = CGRect(x: 175, y: 0, width: 40, height: 40)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    playerNameLabel.frame = CGRect(x: 15,
                                   y: 20,
                                   width: 10,
                                   height: 10)
    
    promptLabel.frame = CGRect(x: 15,
                               y: 40,
                               width: 300,
                               height: 30)
    promptLabel.preferredMaxLayoutWidth = popUpView.bounds.width - 20

    if let closeImage = UIImage(named: "clear_btn") {
      closeButton.setImage(closeImage, for: [])
    }

    popUpView.addSubview(playerNameLabel)
    popUpView.addSubview(promptLabel)
    popUpView.addSubview(closeButton)
    
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
  
  func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func updateUI() {
    var buttonX: CGFloat = 15
    playerNameLabel.text = selectedPlayer.name
    playerNameLabel.sizeToFit()
    
    promptLabel.text = NSLocalizedString("What position would you like to add this player to?",
                                    comment: "Position Pop Up Prompt")
    promptLabel.lineBreakMode = .byWordWrapping
    promptLabel.numberOfLines = 2
    
    let positionButtons = addPositionButtonsToPopUp(selectedPlayer.position)
    for button in positionButtons {
      button.frame = CGRect(x: buttonX, y: 75, width: 40, height: 40)
      buttonX += 10.0
      popUpView.addSubview(button)
    }
    
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
