//
//  MSADraftPlayersViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPlayersViewController: UIViewController {
  
  let playerList = Players()
  var filteredPlayers = [Player]()

  @IBOutlet weak var draftPlayersSearchBar: UISearchBar!
  @IBOutlet weak var draftPlayersTableView: UITableView!
  
  struct DraftPlayersTableViewProps {
    static let topContentInset: CGFloat = 64
    static let bottomContentInset: CGFloat = 0
    static let sideContentInset: CGFloat = 0
    static let cellHeight: CGFloat = 70
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    draftPlayersSearchBar.delegate = self
    draftPlayersTableView.delegate? = self
    draftPlayersTableView.dataSource = self
    

    draftPlayersTableView.contentInset = UIEdgeInsets(top: DraftPlayersTableViewProps.topContentInset,
                                                      left: DraftPlayersTableViewProps.sideContentInset,
                                                      bottom: DraftPlayersTableViewProps.bottomContentInset,
                                                      right: DraftPlayersTableViewProps.sideContentInset)
    draftPlayersTableView.rowHeight = DraftPlayersTableViewProps.cellHeight
    
    draftPlayersTableView.layoutIfNeeded()
  }
  
  func filterPlayersForSearchText(searchText: String, scope: String = "All") {
    filteredPlayers = playerList.filter { player in
      return playerList.espnTopPlayerList.name.lowercaseString.containsSTring(searchText.lowercaseString)
    }
    draftPlayersTableView.reloadData()
  }

  // MARK: - Memory Warning
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension DraftPlayersViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return playerList.espnTopPlayerList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellReuseIdentifier = "PlayerCell"
    let cell: PlayerCell = PlayerCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    
    let rank = indexPath.row + 1
    let positionArray = playerList.espnTopPlayerList[rank]?["position"] as! [String]
    let positionList = positionArray.joined(separator: ", ")
    
    let playerTeam = playerList.espnTopPlayerList[rank]?["team"] as? String
    let playerName = playerList.espnTopPlayerList[rank]?["name"] as? String
    
    cell.playerRankLabel?.text = String(rank)
    cell.playerRankLabel?.sizeToFit()
    
    cell.playerNameLabel?.text = playerName
    cell.playerNameLabel?.sizeToFit()

    cell.playerTeamLabel?.text = playerTeam
    cell.playerTeamLabel?.sizeToFit()
    
    cell.playerPositionLabel?.text = positionList
    cell.playerPositionLabel?.sizeToFit()
    

    return cell
  }
  
}

extension DraftPlayersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }
}

extension DraftPlayersViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    print("search text is: \(draftPlayersSearchBar.text!)")
  }
  
  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
}



