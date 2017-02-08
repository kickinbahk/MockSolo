//
//  HowToPlayViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/8/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {

  var backgroundImage = UIImageView()
  let closeButton = UIButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    view.layoutIfNeeded()
  }
  
  func updateUI() {
    let image = UIImage(named: "stadium")
    backgroundImage = UIImageView(image: image!)
  
    closeButton.backgroundColor = UIColor(red: 46/255, green: 60/255, blue: 70/255, alpha: 1)
    closeButton.layer.cornerRadius = 5
    closeButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    closeButton.setTitle("Close", for: .normal)
    closeButton.setTitleColor(UIColor.white, for: .normal)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    
    view.addSubview(backgroundImage)
    view.addSubview(closeButton)
    
    addConstraints()
  }

  func addConstraints() {
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundImage.contentMode = .scaleAspectFill
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    closeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35)
    
  }

  func close() {
    dismiss(animated: true, completion: nil)
  }

}
