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
  
  var playerList: [Int: [String: Any]] = [
    1: ["name": "Carlos Correa", "position": ["SS"], "team": "CHC"],
    2: ["name": "Clayton Kershaw", "position": ["SP"], "team": "LAD"],
    3: ["name": "Jonathan Villar", "position": ["SS", "2B", "3B"], "team": "MIL"]
    
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
    let positionArray = playerList[rank]?["position"] as! [String]
    let positionList = positionArray.joined(separator: ", ")
    
    cell.playerRankLabel?.text = String(rank)
    cell.playerRankLabel?.sizeToFit()
    
    cell.playerNameLabel?.text = playerList[rank]?["name"] as? String
    cell.playerNameLabel?.sizeToFit()
    
    cell.playerPositionLabel?.text = positionList
    cell.playerPositionLabel?.sizeToFit()

    return cell
  }
  
  func positionArrayToString(_ array: [String]) -> String {
    let positionString = array.joined(separator: ", ")
    print(positionString)
    return positionString
  }

}

extension DraftPlayersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
}



