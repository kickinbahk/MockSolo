//
//  MSADraftPlayersViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPlayersViewController: UIViewController {
  let playerList = [
    Player(rank: 1, name: "Mike Trout", position: ["OF"], team: "LAA"),
    Player(rank: 2, name: "Paul Goldschmidt", position: ["1B"], team: "ARI"),
    Player(rank: 3, name: "Bryce Harper", position: ["OF"], team: "WAS"),
    Player(rank: 4, name: "Clayton Kershaw", position: ["SP"], team: "LAD"),
    Player(rank: 5, name: "Josh Donaldson", position: ["3B"], team: "TOR"),
    Player(rank: 6, name: "Giancarlo Stanton", position: ["OF"], team: "MIA"),
    Player(rank: 7, name: "Manny Machado", position: ["3B"], team: "BAL"),
    Player(rank: 8, name: "Andrew McCutchen", position: ["OF"], team: "PIT"),
    Player(rank: 9, name: "Nolan Arenado", position: ["3B"], team: "COL"),
    Player(rank: 10, name: "Carlos Correa", position: ["SS"], team: "HOU"),
    Player(rank: 11, name: "Jose Altuve", position: ["2B"], team: "HOU"),
    Player(rank: 12, name: "Anthony Rizzo", position: ["1B"], team: "CHC"),
    Player(rank: 13, name: "Jose Bautista", position: ["OF"], team: "TOR"),
    Player(rank: 14, name: "Kris Bryant", position: ["3B"], team: "CHC"),
    Player(rank: 15, name: "Miguel Cabrera", position: ["1B"], team: "DET"),
    Player(rank: 16, name: "Edwin Encarnacion", position: ["1B"], team: "TOR"),
    Player(rank: 17, name: "Mookie Betts", position: ["OF"], team: "BOS"),
    Player(rank: 18, name: "Dee Gordon", position: ["2B"], team: "MIA"),
    Player(rank: 19, name: "Max Scherzer", position: ["SP"], team: "WAS"),
    Player(rank: 20, name: "Jose Abreu", position: ["1B"], team: "CWS"),
    Player(rank: 21, name: "Jake Arrieta", position: ["SP"], team: "CHC"),
    Player(rank: 22, name: "Chris Sale", position: ["SP"], team: "CWS"),
    Player(rank: 23, name: "Starling Marte", position: ["OF"], team: "PIT"),
    Player(rank: 24, name: "David Price", position: ["SP"], team: "BOS" ),
    Player(rank: 25, name: "Charlie Blackmon", position: ["OF"], team: "COL"),
    Player(rank: 26, name: "Madision Bumgarner", position: ["SP"], team: "SF"),
    Player(rank: 27, name: "J.D. Martinez", position: ["OF"], team: "DET"),
    Player(rank: 28, name: "Joey Votto", position: ["1B"], team: "CIN"),
    Player(rank: 29, name: "Gerrit Cole", position: ["SP"], team: "PIT"),
    Player(rank: 30, name: "George Springer", position: ["OF"], team: "HOU"),
    Player(rank: 31, name: "Corey Kluber", position: ["SP"], team: "CLE"),
    Player(rank: 32, name: "Buster Posey", position: ["C/1B"], team: "SP"),
    Player(rank: 33, name: "Chris Davis", position: ["1B/OF"], team: "BAL"),
    Player(rank: 34, name: "Jacob DeGrom", position: ["SP"], team: "NYM"),
    Player(rank: 35, name: "Matt Harvey", position: ["SP"], team: "NYM"),
    Player(rank: 36, name: "Todd Frazier", position: ["3B"], team: "CWS"),
    Player(rank: 37, name: "Chris Archer", position: ["SP"], team: "TB"),
    Player(rank: 38, name: "Robinson Cano", position: ["2B"], team: "SEA"),
    Player(rank: 39, name: "Justin Upton", position: ["OF"], team: "DET"),
    Player(rank: 40, name: "Zack Greinke", position: ["SP"], team: "ARI"),
    Player(rank: 41, name: "Dallas Keuchel", position: ["SP"], team: "HOU"),
    Player(rank: 42, name: "Adrian Gonzalez", position: ["1B"], team: "LAD"),
    Player(rank: 43, name: "Stephen Strasburg", position: ["SP"], team: "WAS"),
    Player(rank: 44, name: "Carlos Gonzalez", position: ["OF"], team: "COL"),
    Player(rank: 45, name: "Nelson Cruz", position: ["OF"], team: "SEA"),
    Player(rank: 46, name: "Jose Fernandez", position: ["SP"], team: "MIA"),
    Player(rank: 47, name: "Yoenis Cespedes", position: ["OF"], team: "NYM"),
    Player(rank: 48, name: "Lorenzo Cain", position: ["OF"], team: "KC"),
    Player(rank: 49, name: "Sonny Gray", position: ["SP"], team: "OAK"),
    Player(rank: 50, name: "Ryan Braun", position: ["OF"], team: "MIL"),
    Player(rank: 51, name: "Xander Bogaerts", position: ["SS"], team: "BOS"),
    Player(rank: 52, name: "Carlos Gomez", position: ["OF"], team: "HOU"),
    Player(rank: 53, name: "Matt Carpenter", position: ["3B"], team: "STL"),
    Player(rank: 54, name: "Troy Tulowitzki", position: ["SS"], team: "TOR"),
    Player(rank: 55, name: "Adam Jones", position: ["OF"], team: "BAL"),
    Player(rank: 56, name: "Adam Wainwright", position: ["SP"], team: "STL"),
    Player(rank: 57, name: "Jason Heyward", position: ["OF"], team: "CHC"),
    Player(rank: 58, name: "Prince Fielder", position: ["DH"], team: "TEX"),
    Player(rank: 59, name: "Noah Syndergaard", position: ["SP"], team: "NYM"),
    Player(rank: 60, name: "Miguel Sano", position: ["DH"], team: "MIN"),
    Player(rank: 61, name: "Kyle Seager", position: ["3B"], team: "SEA"),
    Player(rank: 62, name: "Carlos Carrasco", position: ["SP"], team: "CLE"),
    Player(rank: 63, name: "Eric Hosmer", position: ["1B"], team: "KC"),
    Player(rank: 64, name: "Kenley Jansen", position: ["RP"], team: "LAD"),
    Player(rank: 65, name: "Craig Kimbrel", position: ["RP"], team: "BOS")
  ]
  
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
    draftPlayersTableView.delegate? = self
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
    
    cell.playerPositionLabel?.text = player.position.joined(separator: ", ")
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
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    filterPlayersForSearchText(searchText: searchText)
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    searchIsActive = true
  }
  
  func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    searchIsActive = false
  }
  
  func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    draftPlayersSearchBar.resignFirstResponder()
  }
}




