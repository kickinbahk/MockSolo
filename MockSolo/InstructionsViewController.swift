//
//  InstructionsViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/9/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
  
  let instructionTitleLabel = UILabel()
  let instructionTextField = UITextView()
  let instructions = "1) Pick any player ranked at or below your current pick. \n\n2) Once you choose the player, you will then choose the position to draft the player for. \n\n3) The app will then move you to your next pick and remove any players above it. \n\nRepeat this process till you have filled all your roster. \n\nThe Draft Picks tab wil have the current players you have drafted."
  
  var backgroundImage = UIImageView()
  var dimmedView = UIView()
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return .lightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
    view.layoutIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    UIApplication.shared.statusBarStyle = .lightContent
  }
  
  func updateUI() {
    let image = UIImage(named: "stadium")
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    backgroundImage = UIImageView(image: image!)
    
    instructionTitleLabel.text = "Instructions"
    instructionTitleLabel.textColor = UIColor.white
    
    instructionTextField.text = instructions
    instructionTextField.isEditable = false
    instructionTextField.backgroundColor = UIColor.clear
    instructionTextField.textColor = UIColor.white
    instructionTextField.font = .systemFont(ofSize: 17)
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(instructionTitleLabel)
    dimmedView.addSubview(instructionTextField)
    
    addConstraints()
  }
  
  func addConstraints() {
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
    
    instructionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    instructionTitleLabel.topAnchor.constraint(equalTo: dimmedView.topAnchor, constant: 30).isActive = true
    instructionTitleLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    instructionTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    
    instructionTextField.translatesAutoresizingMaskIntoConstraints = false
    instructionTextField.topAnchor.constraint(equalTo: instructionTitleLabel.bottomAnchor,
                                              constant: 15).isActive = true
    instructionTextField.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 15).isActive = true
    instructionTextField.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor,
                                                   constant: -15).isActive = true
    instructionTextField.bottomAnchor.constraint(greaterThanOrEqualTo: dimmedView.bottomAnchor,
                                                 constant: -50).isActive = true
    
  }
  
}
