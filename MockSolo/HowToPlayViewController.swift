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
  }
  
  func updateUI() {
    let image = UIImage(named: "stadium")
    backgroundImage = UIImageView(image: image!)
    
    view.addSubview(backgroundImage)
    
    addConstraints()
  }

  func addConstraints() {
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundImage.contentMode = .scaleAspectFill
    
  }

  

}
