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
  
  var dimmedView = UIView()
  var startDraftImage = UIImageView()
  var playerDraftPosition: Int = 0
  var playerNumberOfTeams: Int = 0
  
  struct DimmedViewProps {
    static let x: CGFloat = 60
    static let y: CGFloat = 100
    static let width: CGFloat = 200
    static let height: CGFloat = 40
  }
  
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
    
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap))
    gestureRecognizer.cancelsTouchesInView = false
//    gestureRecognizer.delegate = self
    view.addGestureRecognizer(gestureRecognizer)
    
    playerDraftPositionTextField.delegate = self
    playerNumberOfTeamsTextField.delegate = self

    updateUI()
    view.layoutIfNeeded()
    // Do any additional setup after loading the view.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "StartDraft" {
      
      guard let draftPosition = playerDraftPositionTextField.text else {
        print("Invalid Draft Position: \(playerDraftPositionTextField.text)")
        return
      }
      
      guard let numberOfDrafters = playerNumberOfTeamsTextField.text else {
        print("Invalid Number of Drafters: \(playerNumberOfTeamsTextField.text)")
        return
      }
      
      if let draftPositionInt = Int(draftPosition) {
        DraftManager.sharedInstance.draftPickNumber = draftPositionInt
      }
      if let numberOfDraftersInt = Int(numberOfDrafters) {
        DraftManager.sharedInstance.numberOfDrafters = numberOfDraftersInt
      }
      
      DraftManager.sharedInstance.startDraft()
    }
  }

  func updateUI() {
    let image = UIImage(named: "baseball")
    dimmedView.frame = CGRect(x: DimmedViewProps.x,
                        y: DimmedViewProps.y,
                        width: DimmedViewProps.width,
                        height: DimmedViewProps.height)
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    
    startDraftImage = UIImageView(image: image!)
    startDraftImage.frame = CGRect(x: 0,
                                   y: 0,
                                   width: 200,
                                   height: 200)
    
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
    playerDraftPositionTextField.placeholder = "5"
    
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
    playerNumberOfTeamsTextField.placeholder = "10"
    
    
    startDraftButton.frame = CGRect(x: StartDraftButtonProps.x,
                                    y: StartDraftButtonProps.y,
                                    width: StartDraftButtonProps.width,
                                    height: StartDraftButtonProps.height)
    startDraftButton.setTitle("Start Draft", for: .normal)
    startDraftButton.tintColor = UIColor.black
    startDraftButton.setTitleColor(UIColor.blue, for: .normal)
    startDraftButton.setTitleColor(UIColor.gray, for: .disabled)
    startDraftButton.addTarget(self, action: #selector(startDraft), for: .touchUpInside)
    startDraftButton.isEnabled = false
    
    view.addSubview(startDraftImage)
    view.addSubview(dimmedView)
    view.addSubview(playerDraftPositionLabel)
    view.addSubview(playerDraftPositionTextField)
    view.addSubview(playerNumberOfTeamsLabel)
    view.addSubview(playerNumberOfTeamsTextField)
    view.addSubview(startDraftButton)
    
    let margins = view.layoutMarginsGuide
    
    dimmedView.translatesAutoresizingMaskIntoConstraints = false
    dimmedView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
    dimmedView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 20).isActive = true
    
    startDraftButton.translatesAutoresizingMaskIntoConstraints = false
    startDraftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    startDraftButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35).isActive = true
    
    startDraftImage.translatesAutoresizingMaskIntoConstraints = false
    startDraftImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    startDraftImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    startDraftImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    startDraftImage.contentMode = .scaleAspectFill
    
    
  }
  
  func tap() {
    playerDraftPositionTextField.resignFirstResponder()
    playerNumberOfTeamsTextField.resignFirstResponder()
  }
  
  func startDraft(_ sender: UIButton) {
    performSegue(withIdentifier: "StartDraft", sender: sender)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

extension NewDraftSettingsViewController: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    if Int(textField.text!) != nil && Int(textField.text!) != 0 {
      textField.resignFirstResponder()
      if textField == playerDraftPositionTextField {
        playerDraftPosition = Int(textField.text!)!
      } else if textField == playerNumberOfTeamsTextField {
        playerNumberOfTeams = Int(textField.text!)!
      }
      textField.resignFirstResponder()
      
      if playerDraftPosition != 0 && playerNumberOfTeams != 0  {
        startDraftButton.isEnabled = true
      }
    } else {
      let alertController = UIAlertController(title: "Invalid Input",
                                              message: "You must enter a Non-Zero Number", preferredStyle: .alert)
      let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
      alertController.addAction(defaultAction)
      
      present(alertController, animated: true, completion: nil)
    }
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
