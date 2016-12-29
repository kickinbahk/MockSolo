//
//  DraftPicksTableViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/9/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPicksTableViewController: UITableViewController {


  var positions: Roster {
    get {
      return DraftManager.sharedInstance.roster
    }
  }
  
  struct DraftPicksTableViewProps {
    static let topContentInset: CGFloat = 10
    static let bottomContentInset: CGFloat = 64
    static let sideContentInset: CGFloat = 0
    static let cellHeight: CGFloat = 54
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.contentInset = UIEdgeInsetsMake(DraftPicksTableViewProps.topContentInset,
                                                   DraftPicksTableViewProps.sideContentInset,
                                                   DraftPicksTableViewProps.bottomContentInset,
                                                   DraftPicksTableViewProps.sideContentInset)
    self.tableView.rowHeight = DraftPicksTableViewProps.cellHeight
    self.tableView.allowsSelection = false
  }



  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return positions.availablePositions.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellReuseIdentifier = "DraftPickCell"
    let cell: DraftPickCell = DraftPickCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    
    let position = positions.availablePositions[Int(indexPath.row)]
    for (key, value) in position {
      cell.draftPicksPositionLabel?.text = key
      cell.draftPicksPositionLabel?.sizeToFit()
      cell.draftPicksPlayerNameLabel?.text = value
      cell.draftPicksPlayerNameLabel?.sizeToFit()
      
    }

    return cell
  }

  // MARK: - Memory Warning
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
