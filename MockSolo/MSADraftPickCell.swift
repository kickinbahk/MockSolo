//
//  MSADraftPickCell.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/9/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class DraftPickCell: UITableViewCell {
  var draftPicksPositionLabel: UILabel! = UILabel()
  var draftPicksPlayerNameLabel: UILabel! = UILabel()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder")
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    updateUI()
  }
  
  func updateUI() {
    draftPicksPositionLabel.textColor = UIColor.black
    draftPicksPositionLabel.font = UIFont.boldSystemFont(ofSize: 17)
    
    contentView.addSubview(draftPicksPositionLabel)
    contentView.addSubview(draftPicksPlayerNameLabel)
    
    addConstraints()
  }
  
  func addConstraints() {
    draftPicksPositionLabel.translatesAutoresizingMaskIntoConstraints = false
    draftPicksPositionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    draftPicksPositionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                     constant: 15).isActive = true
    
    draftPicksPlayerNameLabel.translatesAutoresizingMaskIntoConstraints = false
    draftPicksPlayerNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    draftPicksPlayerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                       constant: 90).isActive = true
  }
}
