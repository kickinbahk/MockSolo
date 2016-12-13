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
  
  struct PopUpViewProps {
    static let radius: CGFloat = 10
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
                         width: self.view.frame.width / 1.5, height: self.view.frame.height - 400)
    popUpView.backgroundColor = .gray
    popUpView.layer.cornerRadius = PopUpViewProps.radius
    popUpView.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
    view.addSubview(popUpView)
    
    if isPopUp {
      let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
      gestureRecognizer.cancelsTouchesInView = false
      gestureRecognizer.delegate = self
      view.addGestureRecognizer(gestureRecognizer)
    }
  
  }
  
  @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
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
