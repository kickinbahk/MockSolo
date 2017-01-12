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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    playerDraftPositionLabel.frame = CGRect(x: 60, y: 100, width: 100, height: 40)
    playerDraftPositionLabel.text = "What Position Are You Drafting From?"
    
    view.addSubview(playerDraftPositionLabel)

    // Do any additional setup after loading the view.
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
