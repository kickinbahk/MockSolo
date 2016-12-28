  //
//  MSADraftPlayersViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPlayersViewController: UIViewController {
  let playerList = newDraft.players
  
  var filteredPlayers = [Player]()
  var searchIsActive = false
  
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
    draftPlayersTableView.delegate = self
    draftPlayersTableView.dataSource = self
    
    draftPlayersSearchBar.returnKeyType = UIReturnKeyType.done
    draftPlayersSearchBar.enablesReturnKeyAutomatically = false

    draftPlayersTableView.contentInset = UIEdgeInsets(top: DraftPlayersTableViewProps.topContentInset,
                                                      left: DraftPlayersTableViewProps.sideContentInset,
                                                      bottom: DraftPlayersTableViewProps.bottomContentInset,
                                                      right: DraftPlayersTableViewProps.sideContentInset)
    draftPlayersTableView.rowHeight = DraftPlayersTableViewProps.cellHeight
    
    draftPlayersTableView.layoutIfNeeded()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "PositionSelection" {
      let positionSelectionController = segue.destination as! PositionSelectionViewController
      let indexPath = sender as! IndexPath
      var selectedPlayer: Player
      
      if searchIsActive && draftPlayersSearchBar.text != "" {
        selectedPlayer = filteredPlayers[indexPath.row]
      } else {
        selectedPlayer = playerList[indexPath.row]
      }
      positionSelectionController.selectedPlayer = selectedPlayer
      positionSelectionController.isPopUp = true
    }
  }
  
  func filterPlayersForSearchText(searchText: String, scope: String = "All") {
    filteredPlayers = playerList.filter { player in
      return player.name.lowercased().contains(searchText.lowercased())
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
    
    if searchIsActive && draftPlayersSearchBar.text != "" {
      return filteredPlayers.count
    }
    return playerList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellReuseIdentifier = "PlayerCell"
    let cell: PlayerCell = PlayerCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    
    let player: Player
    
    if searchIsActive && draftPlayersSearchBar.text != "" {
      player = filteredPlayers[indexPath.row]
    } else {
      player = playerList[indexPath.row]
    }
    
    cell.playerRankLabel?.text = String(player.rank)
    cell.playerRankLabel?.sizeToFit()
    
    cell.playerNameLabel?.text = player.name
    cell.playerNameLabel?.sizeToFit()

    cell.playerTeamLabel?.text = player.team
    cell.playerTeamLabel?.sizeToFit()
    
    cell.playerPositionLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    cell.playerPositionLabel?.text = player.positions.joined(separator: " / ")
    cell.playerPositionLabel?.sizeToFit()
    

    return cell
  }
  
}

extension DraftPlayersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    draftPlayersTableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: "PositionSelection", sender: indexPath)
  }
}

extension DraftPlayersViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filterPlayersForSearchText(searchText: searchText)
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchIsActive = true
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchIsActive = true
  }
  
  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    draftPlayersSearchBar.resignFirstResponder()
  }
}




