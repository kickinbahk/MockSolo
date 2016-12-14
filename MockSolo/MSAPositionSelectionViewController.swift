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

    let popUpView = UIView()
    popUpView.frame = CGRect(x: 0, y: 0,
                         width: self.view.frame.width / 1.5,
                         height: self.view.frame.height - 400)
    popUpView.backgroundColor = PopUpViewProps.blueGray
    popUpView.layer.cornerRadius = PopUpViewProps.radius
    popUpView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
    view.addSubview(popUpView)
    
    let closeButton = UIButton(type: .custom) as UIButton
    closeButton.frame = CGRect(x: 175, y: 0, width: 40, height: 40)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    playerNameLabel.frame = CGRect(x: 15,
                                   y: 20,
                                   width: 10,
                                   height: 10)
    
    popUpView.addSubview(playerNameLabel)
    
    if let closeImage = UIImage(named: "clear_btn") {
      closeButton.setImage(closeImage, for: [])
    }

    
    popUpView.addSubview(closeButton)
    
    if isPopUp {
      let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
      gestureRecognizer.cancelsTouchesInView = false
      gestureRecognizer.delegate = self
      view.addGestureRecognizer(gestureRecognizer)
      
      if selectedPlayer != nil {
        updateUI()
        print(selectedPlayer)
      }
    }


  }
  
  func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  func updateUI() {
    playerNameLabel.text = selectedPlayer.name
    playerNameLabel.sizeToFit()
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
