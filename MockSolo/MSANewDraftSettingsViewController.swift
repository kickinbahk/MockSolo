//
//  NewDraftSettingsViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 1/12/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class NewDraftSettingsViewController: UIViewController {

  let howToPlayButton = UIButton()
  let pageTitle = UILabel()
  let playerDraftPositionLabel = UILabel()
  let playerDraftPositionTextField = UITextField()
  let playerDraftPositionPicker = UIPickerView()
  let playerNumberOfTeamsLabel = UILabel()
  let playerNumberOfTeamsTextField = UITextField()
  let startDraftButton = UIButton()
  
  var dimmedView = UIView()
  var startDraftImage = UIImageView()
  var playerDraftPosition: Int = 0
  var playerDraftPositionPickerOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  var playerNumberOfTeams: Int = 0
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return .lightContent
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap))
    gestureRecognizer.cancelsTouchesInView = false
    view.addGestureRecognizer(gestureRecognizer)
    
    playerDraftPositionTextField.delegate = self
    playerNumberOfTeamsTextField.delegate = self
    playerDraftPositionPicker.dataSource = self
    playerDraftPositionPicker.delegate = self

    updateUI()
    view.layoutIfNeeded()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    UIApplication.shared.statusBarStyle = .lightContent
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
    dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)
    
    startDraftImage = UIImageView(image: image!)
    
    pageTitle.text = "MockSolo"
    pageTitle.textColor = UIColor.white
    pageTitle.font = UIFont.boldSystemFont(ofSize: 20)
    
    howToPlayButton.setTitle("Click Here for Instructions", for: .normal)
    howToPlayButton.setTitleColor(UIColor.cyan, for: .normal)
    howToPlayButton.addTarget(self, action: #selector(openHowToPlay), for: .touchUpInside)
    howToPlayButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
    howToPlayButton.layer.cornerRadius = 5
    
    
    playerDraftPositionLabel.textColor = UIColor.white
    playerDraftPositionLabel.text = "What Position Are You Drafting From?"
    playerDraftPositionLabel.lineBreakMode = .byWordWrapping
    playerDraftPositionLabel.numberOfLines = 2
    playerDraftPositionLabel.preferredMaxLayoutWidth = view.bounds.width - 10
    playerDraftPositionLabel.sizeToFit()
    
    playerDraftPositionTextField.layer.masksToBounds = true
    playerDraftPositionTextField.layer.borderWidth = 1.0
    playerDraftPositionTextField.layer.borderColor = UIColor.white.cgColor
    playerDraftPositionTextField.textColor = UIColor.white
    playerDraftPositionTextField.tintColor = UIColor.white
    playerDraftPositionTextField.borderStyle = .line
    playerDraftPositionTextField.textAlignment = .center
    playerDraftPositionTextField.attributedPlaceholder = NSAttributedString(string:"5",
                                                                             attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
    
    playerNumberOfTeamsLabel.textColor = UIColor.white
    playerNumberOfTeamsLabel.text = "How Many Teams Are In Your League?"
    playerNumberOfTeamsLabel.lineBreakMode = .byWordWrapping
    playerNumberOfTeamsLabel.numberOfLines = 3
    playerNumberOfTeamsLabel.preferredMaxLayoutWidth = view.bounds.width - 10
    playerNumberOfTeamsLabel.sizeToFit()
  
    
    playerNumberOfTeamsTextField.layer.masksToBounds = true
    playerNumberOfTeamsTextField.layer.borderWidth = 1.0
    playerNumberOfTeamsTextField.layer.borderColor = UIColor.white.cgColor
    playerNumberOfTeamsTextField.textColor = UIColor.white
    playerNumberOfTeamsTextField.tintColor = UIColor.white
    playerNumberOfTeamsTextField.borderStyle = .line
    playerNumberOfTeamsTextField.textAlignment = .center
    playerNumberOfTeamsTextField.attributedPlaceholder = NSAttributedString(string:"10",
                                                                            attributes:[NSForegroundColorAttributeName: UIColor.lightGray])
    
    startDraftButton.backgroundColor = UIColor(red: 46/255, green: 60/255, blue: 70/255, alpha: 1)
    startDraftButton.layer.cornerRadius = 5
    startDraftButton.contentEdgeInsets = UIEdgeInsetsMake(20, 20, 20, 20)
    startDraftButton.setTitle("Start Draft", for: .normal)
    startDraftButton.tintColor = UIColor.black
    startDraftButton.setTitleColor(UIColor.white, for: .normal)
    startDraftButton.setTitleColor(UIColor.gray, for: .disabled)
    startDraftButton.addTarget(self, action: #selector(startDraft), for: .touchUpInside)
    startDraftButton.isEnabled = false
    
    view.addSubview(startDraftImage)
    view.addSubview(dimmedView)
    dimmedView.addSubview(pageTitle)
    dimmedView.addSubview(howToPlayButton)
    dimmedView.addSubview(playerDraftPositionLabel)
    dimmedView.addSubview(playerDraftPositionPicker)
    dimmedView.addSubview(playerDraftPositionTextField)
    dimmedView.addSubview(playerNumberOfTeamsLabel)
    dimmedView.addSubview(playerNumberOfTeamsTextField)
    dimmedView.addSubview(startDraftButton)
    
    addConstraints()
  }
  
  func addConstraints() {
    dimmedView.translatesAutoresizingMaskIntoConstraints = false
    dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    dimmedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    
    pageTitle.translatesAutoresizingMaskIntoConstraints = false
    pageTitle.topAnchor.constraint(equalTo: dimmedView.topAnchor, constant: 40).isActive = true
    pageTitle.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    
    howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
    howToPlayButton.topAnchor.constraint(equalTo: pageTitle.topAnchor, constant: 75).isActive = true
    howToPlayButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    
    playerDraftPositionLabel.translatesAutoresizingMaskIntoConstraints = false
    playerDraftPositionLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    playerDraftPositionLabel.bottomAnchor.constraint(equalTo: playerDraftPositionTextField.topAnchor,
                                                     constant: -20).isActive = true
    
    playerDraftPositionPicker.translatesAutoresizingMaskIntoConstraints = false
    playerDraftPositionPicker.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    playerDraftPositionPicker.bottomAnchor.constraint(equalTo: playerNumberOfTeamsLabel.topAnchor,
                                                      constant: -30).isActive = true
    
//    playerDraftPositionTextField.translatesAutoresizingMaskIntoConstraints = false
//    playerDraftPositionTextField.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
//    playerDraftPositionTextField.bottomAnchor.constraint(equalTo: playerNumberOfTeamsLabel.topAnchor,
//                                                         constant: -30).isActive = true
//    playerDraftPositionTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    
    playerNumberOfTeamsLabel.translatesAutoresizingMaskIntoConstraints = false
    playerNumberOfTeamsLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    playerNumberOfTeamsLabel.bottomAnchor.constraint(equalTo: playerNumberOfTeamsTextField.topAnchor,
                                                     constant: -20).isActive = true
    
    playerNumberOfTeamsTextField.translatesAutoresizingMaskIntoConstraints = false
    playerNumberOfTeamsTextField.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    playerNumberOfTeamsTextField.bottomAnchor.constraint(equalTo: startDraftButton.topAnchor,
                                                         constant: -40).isActive = true
    playerNumberOfTeamsTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
    
    startDraftImage.translatesAutoresizingMaskIntoConstraints = false
    startDraftImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    startDraftImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    startDraftImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    startDraftImage.contentMode = .scaleAspectFill
    
    startDraftButton.translatesAutoresizingMaskIntoConstraints = false
    startDraftButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
    startDraftButton.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor, constant: -35).isActive = true
  }
  
  func tap() {
    playerDraftPositionTextField.resignFirstResponder()
    playerNumberOfTeamsTextField.resignFirstResponder()
  }

  func openHowToPlay(_ sender: UIButton) {
    performSegue(withIdentifier: "HowToPlay", sender: sender)
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
      
      if playerDraftPosition != 0 && playerNumberOfTeams != 0 {
        if playerNumberOfTeams < 33 {
          if playerDraftPosition <= playerNumberOfTeams {
            startDraftButton.isEnabled = true
          } else {
            let alertController = UIAlertController(title: "Invalid Input",
                                                    message: "Your draft position must be less than the number of total teams drafting", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
          }
        } else {
          let alertController = UIAlertController(title: "Invalid Input",
                                                  message: "You must enter 32 teams or less", preferredStyle: .alert)
          let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alertController.addAction(defaultAction)
          
          present(alertController, animated: true, completion: nil)
        }

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

extension NewDraftSettingsViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return String(playerDraftPositionPickerOptions[row])
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    playerDraftPosition = playerDraftPositionPickerOptions[row]
  }
}

extension NewDraftSettingsViewController: UIPickerViewDataSource {
  func numberOfComponents(in: UIPickerView) -> Int {
    return 1
  }
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return playerDraftPositionPickerOptions.count
  }
}
