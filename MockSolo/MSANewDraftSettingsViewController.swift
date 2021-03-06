//
//  NewDraftSettingsViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 1/12/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class NewDraftSettingsViewController: UIViewController {
    let playerArray: [Player]?

    let howToPlayButton = UIButton()
    let pageTitle = UILabel()

    let playerNumberOfTeamsLabel = UILabel()
    let playerNumberOfTeamsTextField = UITextField()
    let playerNumberOfTeamsPicker = UIPickerView()

    let playerDraftPositionLabel = UILabel()
    let playerDraftPositionTextField = UITextField()
    let playerDraftPositionPicker = UIPickerView()

    let startDraftButton = UIButton()

    var dimmedView = UIView()
    var startDraftImage = UIImageView()
    var playerDraftPosition: Int = 0
    var playerDraftPositionPickerOptions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var playerNumberOfTeams: Int = 0
    var playerNumberOfTeamsPickerOptions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                            11, 12, 13, 14, 15, 16, 17, 18, 19,
                                            20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        gestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(gestureRecognizer)

        playerNumberOfTeamsPicker.dataSource = self
        playerNumberOfTeamsPicker.delegate = self

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
            let draft = Draft(players: playersArray, draftPosition: playerDraftPosition, numberOfTeams: playerNumberOfTeams)
        }
    }

    func updateUI() {
        let image = UIImage(named: "baseball")
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.65)

        startDraftImage = UIImageView(image: image!)

        pageTitle.text = "MockSolo"
        pageTitle.textColor = .white
        pageTitle.font = UIFont.boldSystemFont(ofSize: 30)
        pageTitle.adjustsFontSizeToFitWidth = true
        pageTitle.minimumScaleFactor = 0.8
        pageTitle.sizeToFit()

        playerNumberOfTeamsLabel.textColor = .white
        playerNumberOfTeamsLabel.text = "How Many Teams Are In Your League?"
        playerNumberOfTeamsLabel.font = UIFont.systemFont(ofSize: 20)
        playerNumberOfTeamsLabel.lineBreakMode = .byTruncatingTail
        playerNumberOfTeamsLabel.numberOfLines = 1
        playerNumberOfTeamsLabel.minimumScaleFactor = 0.8
        playerNumberOfTeamsLabel.adjustsFontSizeToFitWidth = true
        playerNumberOfTeamsLabel.sizeToFit()

        playerNumberOfTeamsPicker.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        playerDraftPositionLabel.textColor = UIColor.white
        playerDraftPositionLabel.text = "What Position Are You Drafting From?"
        playerDraftPositionLabel.font = UIFont.systemFont(ofSize: 20)
        playerDraftPositionLabel.lineBreakMode = .byTruncatingTail
        playerDraftPositionLabel.numberOfLines = 1
        playerDraftPositionLabel.minimumScaleFactor = 0.8
        playerDraftPositionLabel.adjustsFontSizeToFitWidth = true
        playerDraftPositionLabel.sizeToFit()

        playerDraftPositionPicker.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        playerDraftPositionPicker.isUserInteractionEnabled = false
        playerDraftPositionPicker.alpha = 0.5

        howToPlayButton.setTitle("Click Here for Instructions", for: .normal)
        howToPlayButton.setTitleColor(UIColor.cyan, for: .normal)
        howToPlayButton.addTarget(self, action: #selector(openHowToPlay), for: .touchUpInside)
        howToPlayButton.contentEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10)
        howToPlayButton.layer.cornerRadius = 5


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
        dimmedView.addSubview(playerNumberOfTeamsLabel)
        dimmedView.addSubview(playerNumberOfTeamsPicker)
        dimmedView.addSubview(playerDraftPositionLabel)
        dimmedView.addSubview(playerDraftPositionPicker)
        dimmedView.addSubview(startDraftButton)

        addConstraints()
    }
  
    func addConstraints() {
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        dimmedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true

        startDraftImage.translatesAutoresizingMaskIntoConstraints = false
        startDraftImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startDraftImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        startDraftImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        startDraftImage.contentMode = .scaleAspectFill

        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        pageTitle.topAnchor.constraint(equalTo: dimmedView.topAnchor, constant: 40).isActive = true
        pageTitle.widthAnchor.constraint(lessThanOrEqualTo: dimmedView.widthAnchor,
                                         constant: -10).isActive = true
        pageTitle.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true

        playerNumberOfTeamsLabel.translatesAutoresizingMaskIntoConstraints = false
        playerNumberOfTeamsLabel.widthAnchor.constraint(lessThanOrEqualTo: dimmedView.widthAnchor,
                                                        constant: -10).isActive = true
        playerNumberOfTeamsLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        playerNumberOfTeamsLabel.bottomAnchor.constraint(greaterThanOrEqualTo: pageTitle.bottomAnchor,
                                                         constant: 30).isActive = true
        playerNumberOfTeamsLabel.bottomAnchor.constraint(lessThanOrEqualTo: pageTitle.bottomAnchor,
                                                         constant: 70).isActive = true

        playerNumberOfTeamsPicker.translatesAutoresizingMaskIntoConstraints = false
        playerNumberOfTeamsPicker.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        playerNumberOfTeamsPicker.topAnchor.constraint(equalTo: playerNumberOfTeamsLabel.bottomAnchor,
                                                       constant: -35).isActive = true

        playerDraftPositionLabel.translatesAutoresizingMaskIntoConstraints = false
        playerDraftPositionLabel.widthAnchor.constraint(lessThanOrEqualTo: dimmedView.widthAnchor,
                                                        constant: -10).isActive = true
        playerDraftPositionLabel.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        playerDraftPositionLabel.topAnchor.constraint(greaterThanOrEqualTo: playerNumberOfTeamsPicker.bottomAnchor,
                                                         constant: -30).isActive = true
        playerDraftPositionLabel.topAnchor.constraint(lessThanOrEqualTo: playerNumberOfTeamsPicker.bottomAnchor,
                                                      constant: 10).isActive = true

        playerDraftPositionPicker.translatesAutoresizingMaskIntoConstraints = false
        playerDraftPositionPicker.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        playerDraftPositionPicker.topAnchor.constraint(equalTo: playerDraftPositionLabel.bottomAnchor,
                                                          constant: -35).isActive = true
        playerDraftPositionPicker.bottomAnchor.constraint(lessThanOrEqualTo: howToPlayButton.topAnchor,
                                                          constant: 40).isActive = true

        howToPlayButton.translatesAutoresizingMaskIntoConstraints = false
        howToPlayButton.topAnchor.constraint(equalTo: startDraftButton.topAnchor, constant: -60).isActive = true
        howToPlayButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true


        startDraftButton.translatesAutoresizingMaskIntoConstraints = false
        startDraftButton.centerXAnchor.constraint(equalTo: dimmedView.centerXAnchor).isActive = true
        startDraftButton.bottomAnchor.constraint(equalTo: dimmedView.bottomAnchor, constant: -35).isActive = true
    }
    
    @objc func tap() {
        playerDraftPositionTextField.resignFirstResponder()
        playerNumberOfTeamsTextField.resignFirstResponder()
    }

    @objc func openHowToPlay(_ sender: UIButton) {
        performSegue(withIdentifier: "HowToPlay", sender: sender)
    }
  
    @objc func startDraft(_ sender: UIButton) {
        performSegue(withIdentifier: "StartDraft", sender: sender)
    }

}


extension NewDraftSettingsViewController: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == playerNumberOfTeamsPicker {
            return String(playerNumberOfTeamsPickerOptions[row])
        } else if pickerView == playerDraftPositionPicker {
            return String(playerDraftPositionPickerOptions[row])
        } else {
            return ""
        }

    }
  
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == playerNumberOfTeamsPicker {
            var pickNumbers = [Int]()
            playerNumberOfTeams = playerNumberOfTeamsPickerOptions[row]
          
            for number in 0...playerNumberOfTeams {
                pickNumbers.append(number)
            }
          
            if playerNumberOfTeamsPickerOptions[row] == 0 {
                playerDraftPositionPicker.isUserInteractionEnabled = false
                playerDraftPositionPicker.alpha = 0.5
                let alertController = UIAlertController(title: "Invalid Input",
                                                        message: "You must Choose a Number Greater than Zero",
                                                        preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            } else {
                playerDraftPositionPickerOptions = pickNumbers
                playerDraftPositionPicker.reloadAllComponents()
                playerDraftPositionPicker.isUserInteractionEnabled = true
                playerDraftPositionPicker.alpha = 1
            }
        } else if pickerView == playerDraftPositionPicker {
          playerDraftPosition = playerDraftPositionPickerOptions[row]
        }
        if playerDraftPosition > 0 && playerNumberOfTeams > 0 {
          startDraftButton.isEnabled = true
        }
    }
  
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var label = NSAttributedString(string: "",
                                       attributes: [ NSAttributedStringKey.foregroundColor: UIColor.white ])
        if pickerView == playerNumberOfTeamsPicker {
            let pickerLabel = String(playerNumberOfTeamsPickerOptions[row])
            label = NSAttributedString(string: pickerLabel,
                                     attributes: [ NSAttributedStringKey.foregroundColor: UIColor.white ])
        } else if pickerView == playerDraftPositionPicker {
            let pickerLabel = String(playerDraftPositionPickerOptions[row])
            label = NSAttributedString(string: pickerLabel,
                                     attributes: [ NSAttributedStringKey.foregroundColor: UIColor.white ])
        }

        return label
    }
}

extension NewDraftSettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == playerNumberOfTeamsPicker {
            return playerNumberOfTeamsPickerOptions.count
        } else if pickerView == playerDraftPositionPicker {
            return playerDraftPositionPickerOptions.count
        } else {
            return 0
        }
    }
}
