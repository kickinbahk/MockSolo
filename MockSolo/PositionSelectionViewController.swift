//
//  PositionSelectionViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/12/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class PositionSelectionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    let popUp = UIView()
    
    popUp.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    
    view.addSubview(popUp)

    // Do any additional setup after loading the view.
  }

  // MARK: - Navigation
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

}
