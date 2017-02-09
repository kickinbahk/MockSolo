//
//  RootTabBarViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/9/17.
//  Copyright © 2017 kickinbahk Productions. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

      self.tabBar.items?[0].image = UIImage(named: "search_btn")
    
      self.tabBar.items?[1].image = UIImage(named: "username_icon")

      self.tabBar.items?[2].image = UIImage(named: "info")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
