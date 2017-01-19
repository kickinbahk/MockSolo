//
//  NewDraftSettingsViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 1/12/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class NewDraftSettingsViewController: UIViewController {

  let playerDraftPositionLabel = UILabel()
  let playerDraftPositionTextField = UITextField()
  let playerNumberOfTeamsLabel = UILabel()
  let playerNumberOfTeamsTextField = UITextField()
  let startDraftButton = UIButton()
  
  let playerDraftPosition = DraftManager.sharedInstance.draftPickNumber
  let playerNumberOfTeams = DraftManager.sharedInstance.numberOfDrafters
  
  
  struct PlayerDraftPositionLabelProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 100
    static let width: CGFloat = 200
    static let height: CGFloat = 40
  }
  
  struct PlayerDraftPositionTextFieldProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 150
    static let width: CGFloat = 150
    static let height: CGFloat = 30
  }
  
  struct PlayerNumberOfTeamsLabelProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 200
    static let width: CGFloat = 200
    static let height: CGFloat = 40
  }
  
  struct PlayerNumberOfTeamsTextFieldProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 250
    static let width: CGFloat = 150
    static let height: CGFloat = 30
  }
  
  struct StartDraftButtonProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 100
    static let width: CGFloat = 150
    static let height: CGFloat = 40
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    updateUI()
    // Do any additional setup after loading the view.
  }

  func updateUI() {
    playerDraftPositionLabel.frame = CGRect(x: PlayerDraftPositionLabelProps.x,
                                            y: PlayerDraftPositionLabelProps.y,
                                            width: PlayerDraftPositionLabelProps.width,
                                            height: PlayerDraftPositionLabelProps.height)
    playerDraftPositionLabel.text = "What Position Are You Drafting From?"
    playerDraftPositionLabel.lineBreakMode = .byWordWrapping
    playerDraftPositionLabel.numberOfLines = 2
    playerDraftPositionLabel.preferredMaxLayoutWidth = view.bounds.width - 10
    playerDraftPositionLabel.sizeToFit()
    
    playerDraftPositionTextField.frame = CGRect(x: PlayerDraftPositionTextFieldProps.x,
                                                y: PlayerDraftPositionTextFieldProps.y,
                                                width: PlayerDraftPositionTextFieldProps.width,
                                                height: PlayerDraftPositionTextFieldProps.height)
    playerDraftPositionTextField.borderStyle = .line
    playerDraftPositionTextField.placeholder = String(playerDraftPosition)
    
    playerNumberOfTeamsLabel.frame = CGRect(x: PlayerNumberOfTeamsLabelProps.x,
                                            y: PlayerNumberOfTeamsLabelProps.y,
                                            width: PlayerNumberOfTeamsLabelProps.width,
                                            height: PlayerNumberOfTeamsLabelProps.height)
    playerNumberOfTeamsLabel.text = "How Many Teams Are In Your League?"
    playerNumberOfTeamsLabel.lineBreakMode = .byWordWrapping
    playerNumberOfTeamsLabel.numberOfLines = 3
    playerNumberOfTeamsLabel.preferredMaxLayoutWidth = view.bounds.width - 10
    playerNumberOfTeamsLabel.sizeToFit()
    
    playerNumberOfTeamsTextField.frame = CGRect(x: PlayerNumberOfTeamsTextFieldProps.x,
                                                y: PlayerNumberOfTeamsTextFieldProps.y,
                                                width: PlayerNumberOfTeamsTextFieldProps.width,
                                                height: PlayerNumberOfTeamsTextFieldProps.height)
    playerNumberOfTeamsTextField.borderStyle = .line
    playerNumberOfTeamsTextField.placeholder = String(playerNumberOfTeams)
    
    
    startDraftButton.frame = CGRect(x: StartDraftButtonProps.x,
                                    y: StartDraftButtonProps.y,
                                    width: StartDraftButtonProps.width,
                                    height: StartDraftButtonProps.height)
    startDraftButton.setTitle("Start Draft", for: .normal)
    startDraftButton.tintColor = UIColor.black
    startDraftButton.setTitleColor(UIColor.blue, for: .normal)
    startDraftButton.addTarget(self, action: #selector(startDraft), for: .touchUpInside)
    

    view.addSubview(playerDraftPositionLabel)
    view.addSubview(playerDraftPositionTextField)
    view.addSubview(playerNumberOfTeamsLabel)
    view.addSubview(playerNumberOfTeamsTextField)
    view.addSubview(startDraftButton)
    
    startDraftButton.translatesAutoresizingMaskIntoConstraints = false
    startDraftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    startDraftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
  }
  
  func startDraft(_ sender: UIButton) {
    performSegue(withIdentifier: "StartDraft", sender: sender)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
