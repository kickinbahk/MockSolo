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
  let instructionTextLabel = UILabel()
  let instructions = "This app allows you to practice drafting on your own. Each pick you will only be able to select the available players below your current pick. \n\nIt will help you get a feel of where you should target certain positions and where you can wait on a player. \n\nAt the end of the draft you have constructed the team from the best available players with none falling to you. In the actual draft you should do even better as players will fall to you. \n\nEnter the position you are drafting from and how many teams are in your league to start..."
  
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
    
    instructionTitleLabel.text = "How Use this App..."
    instructionTitleLabel.textColor = UIColor.white
    
    instructionTextLabel.text = instructions
    instructionTextLabel.numberOfLines = 0
    instructionTextLabel.textColor = UIColor.white
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(instructionTitleLabel)
    dimmedView.addSubview(instructionTextLabel)
    
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
    
    
    instructionTextLabel.translatesAutoresizingMaskIntoConstraints = false
    instructionTextLabel.topAnchor.constraint(equalTo: instructionTitleLabel.topAnchor,
                                              constant: 20).isActive = true
    instructionTextLabel.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 15).isActive = true
    instructionTextLabel.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor,
                                                   constant: -15).isActive = true
    instructionTextLabel.bottomAnchor.constraint(equalTo: dimmedView.topAnchor, constant: -15).isActive = true
    
    
  }
  
}
