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
  let instructionLabel = UILabel()
  
  var backgroundImage = UIImageView()
  var dimmedView = UIView()
  
  let instructions = "This app allows you to practice drafting on your own. Each pick you will only be able to select the available players below your current pick. It will help you get a feel of where you should target certain positions and where you can wait on a player. At the end of the draft you have constructed the team from the best available players with none falling to you. In the actual draft you should do even better as players will fall to you."

  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    view.layoutIfNeeded()
  }
  
  func updateUI() {
    let image = UIImage(named: "stadium")
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    backgroundImage = UIImageView(image: image!)
    
    instructionLabel.backgroundColor = UIColor.yellow
    instructionLabel.text = instructions
    instructionLabel.textColor = UIColor.white
  
    closeButton.backgroundColor = UIColor(red: 46/255, green: 60/255, blue: 70/255, alpha: 1)
    closeButton.layer.cornerRadius = 5
    closeButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    closeButton.setTitle("Close", for: .normal)
    closeButton.setTitleColor(UIColor.white, for: .normal)
    closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
    
    
    view.addSubview(backgroundImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(instructionLabel)
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
    
    instructionLabel.translatesAutoresizingMaskIntoConstraints = false
    instructionLabel.topAnchor.constraint(equalTo: dimmedView.topAnchor, constant: 20).isActive = true
    instructionLabel.leadingAnchor.constraint(equalTo: dimmedView.leadingAnchor, constant: 15).isActive = true
    instructionLabel.trailingAnchor.constraint(equalTo: dimmedView.trailingAnchor, constant: -15).isActive = true
    instructionLabel.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20).isActive = true
  
    
    closeButton.translatesAutoresizingMaskIntoConstraints = false
    closeButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    closeButton.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor, constant: -25).isActive = true
    
  }

  func close() {
    dismiss(animated: true, completion: nil)
  }

}
