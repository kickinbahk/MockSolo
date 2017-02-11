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
    
    restartDraftButton.backgroundColor = UIColor(red: 46/255, green: 60/255, blue: 70/255, alpha: 1)
    restartDraftButton.layer.cornerRadius = 5
    restartDraftButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    restartDraftButton.setTitle("Restart Draft", for: .normal)
    restartDraftButton.tintColor = UIColor.black
    restartDraftButton.setTitleColor(UIColor.white, for: .normal)
    restartDraftButton.addTarget(self, action: #selector(restartDraft), for: .touchUpInside)
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(restartDraftButton)
    
    addContstraints()
  }
  
  func addContstraints() {
    backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    backgroundImage.contentMode = .scaleAspectFit
    
    dimmedView.translatesAutoresizingMaskIntoConstraints = false
    dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    dimmedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    
    restartDraftButton.translatesAutoresizingMaskIntoConstraints = false
    restartDraftButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    restartDraftButton.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor, constant: -95).isActive = true
    
  }
  
  func restartDraft(_ sender: UIButton) {
    performSegue(withIdentifier: "RestartDraft", sender: sender)
  }
}
