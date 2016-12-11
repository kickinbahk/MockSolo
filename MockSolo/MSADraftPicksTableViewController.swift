//
//  DraftPicksTableViewController.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/9/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPicksTableViewController: UITableViewController {
  
  var positionsArr = ["C", "1B", "2B", "SS", "2B/SS", "3B", "1B/3B", "OF", "OF", "OF", "OF", "OF", "Util",
                   "P", "P", "P", "P", "P", "P", "P", "P", "P",
                   "Bench", "Bench", "Bench"]

  // TODO: Need way to add picked players to correct cell
  
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
    return positionsArr.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellReuseIdentifier = "DraftPickCell"
    let cell: DraftPickCell = DraftPickCell(style: .default, reuseIdentifier: cellReuseIdentifier)
    
    let position = positionsArr[Int(indexPath[1])]
    
    cell.draftPicksPositionLabel?.text = position
    cell.draftPicksPositionLabel?.sizeToFit()

    return cell
  }

  // MARK: - Memory Warning
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
