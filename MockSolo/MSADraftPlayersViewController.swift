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
    1: ["name": "Carlos Correa"],
    2: ["name": "Clayton Kershaw"],
    
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    draftPlayersTableView.delegate? = self
    draftPlayersTableView.dataSource = self

    draftPlayersTableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    draftPlayersTableView.rowHeight = 70
    
    draftPlayersTableView.layoutIfNeeded()
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
    let rank = Int(indexPath[1]) + 1
    cell.playerNameLabel?.text = playerList[rank]?["name"]
    cell.playerNameLabel?.sizeToFit()

    return cell
  }
  

}

extension DraftPlayersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
}



