//
//  HowToPlayViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/8/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class HowToPlayViewController: UIViewController {
  
  let closeButton = UIButton()
  let instructionTitleLabel = UILabel()
  let instructionTextLabel = UILabel()
  
  var backgroundImage = UIImageView()
  var dimmedView = UIView()
  
  let instructions = "This app allows you to practice drafting on your own. Each pick you will only be able to select the available players below your current pick. \n\nIt will help you get a feel of where you should target certain positions and where you can wait on a player. \n\nAt the end of the draft you have constructed the team from the best available players with none falling to you. In the actual draft you should do even better as players will fall to you."

  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    view.layoutIfNeeded()
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
  
    closeButton.backgroundColor = UIColor(red: 46/255, green: 60/255, blue: 70/255, alpha: 1)
    closeButton.layer.cornerRadius = 5
    closeButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    closeButton.setTitle("Close", for: .normal)
    closeButton.setTitleColor(UIColor.white, for: .normal)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(instructionTitleLabel)
    dimmedView.addSubview(instructionTextLabel)
    dimmedView.addSubview(closeButton)
    
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
    instructionTitleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    
    
    instructionTextLabel.translatesAutoresizingMaskIntoConstraints = false
    instructionTextLabel.topAnchor.constraint(equalTo: instructionTitleLabel.topAnchor,
                                              constant: 10).isActive = true
    instructionTextLabel.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 15).isActive = true
    instructionTextLabel.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor,
                                                   constant: -15).isActive = true
    instructionTextLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20).isActive = true
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    closeButton.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor, constant: -25).isActive = true
    
  }

  func close() {
    dismiss(animated: true, completion: nil)
  }

}
