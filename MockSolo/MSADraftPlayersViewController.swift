//
//  MSADraftPlayersViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPlayersViewController: UIViewController {

  @IBOutlet weak var draftPlayersSearchBar: UISearchBar!
  @IBOutlet weak var draftPlayersTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    draftPlayersTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    // Do any additional setup after loading the view.
  }

  // MARK: - Memory Warning
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension DraftPlayersViewController: UITableViewDataSource {
  
}

extension DraftPlayersViewController: UITableViewDelegate {
  
}
