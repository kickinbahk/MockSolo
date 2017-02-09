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

      self.tabBar.items?[0].image = UIImage(named: "search_btn")?.withRenderingMode(.alwaysOriginal)
//      self.tabBar.items?[0].selectedImage = UIImage(named: "active_image_0")?.withRenderingMode(.alwaysOriginal)
      
      self.tabBar.items?[1].image = UIImage(named: "username_icon")?.withRenderingMode(.alwaysOriginal)
//      self.tabBar.items?[1].selectedImage = UIImage(named: "active_image_1")?.withRenderingMode(.alwaysOriginal)

//      self.tabBar.items?[2].image = UIImage(named: "more_info_btn")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
