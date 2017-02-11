//
//  RestartDraftViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/11/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class RestartDraftViewController: UIViewController {
  let restartDraftLabel = UILabel()
  let restartDraftButton = UIButton()
  
  var backgroundImage = UIImageView()
  var dimmedView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    view.layoutIfNeeded()
  }

  func updateUI() {
    let image = UIImage(named: "stadium_seats")
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    backgroundImage = UIImageView(image: image)
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    
    addContstraints()
  }
  
  func addContstraints() {
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundImage.contentMode = .scaleAspectFit
    
  }
}
