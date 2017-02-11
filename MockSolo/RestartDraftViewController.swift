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
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    view.layoutIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    UIApplication.shared.statusBarStyle =  .lightContent
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "RestartDraft" {
      DraftManager.sharedInstance.newDraft()
    }
  }

  func updateUI() {
    let image = UIImage(named: "stadium_seats")
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    backgroundImage = UIImageView(image: image)
    
    restartDraftLabel.text = "Do you really want to restart the draft?"
    restartDraftLabel.textColor = UIColor.white
    restartDraftLabel.font = UIFont.boldSystemFont(ofSize: 20)
    restartDraftLabel.numberOfLines = 2
    restartDraftLabel.textAlignment = .center
    
    restartDraftButton.backgroundColor = UIColor(red: 242/255, green: 43/255, blue: 41/255, alpha: 1)
    restartDraftButton.layer.cornerRadius = 5
    restartDraftButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    restartDraftButton.setTitle("Restart Draft", for: .normal)
    restartDraftButton.tintColor = UIColor.black
    restartDraftButton.setTitleColor(UIColor.white, for: .normal)
    restartDraftButton.addTarget(self, action: #selector(restartDraft), for: .touchUpInside)
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(restartDraftLabel)
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
    
    restartDraftLabel.translatesAutoresizingMaskIntoConstraints = false
    restartDraftLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    restartDraftLabel.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width - 40).isActive = true
    restartDraftLabel.bottomAnchor.constraint(equalTo: restartDraftButton.topAnchor, constant: -60).isActive = true
    
    restartDraftButton.translatesAutoresizingMaskIntoConstraints = false
    restartDraftButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    restartDraftButton.centerYAnchor.constraint(equalTo: dimmedView.centerYAnchor, constant: 40).isActive = true
    
  }
  
  func restartDraft(_ sender: UIButton) {
    performSegue(withIdentifier: "RestartDraft", sender: sender)
  }
}
