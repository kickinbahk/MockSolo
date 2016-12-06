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
  
  var playerList: [Int: [String: String]] = [
    0: ["name": "Carlos Correa"],
    1: ["name": "Clayton Kershaw"],
    
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    draftPlayersTableView.delegate? = self
    draftPlayersTableView.dataSource = self

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
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return playerList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellReuseIdentifier = "PlayerCell"
    let cell: PlayerCell = PlayerCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    print(indexPath[1])
    cell.playerNameLabel?.text = playerList[Int(indexPath[1])]!["name"]!

    
    return cell
  }
}

extension DraftPlayersViewController: UITableViewDelegate {
  
}
