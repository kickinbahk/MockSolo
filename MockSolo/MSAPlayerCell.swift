//
//  PlayerCell.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
  var playerNameLabel: UILabel! = UILabel()
  var playerRankLabel: UILabel! = UILabel()
  var playerTeamLabel: UILabel! = UILabel()
  var playerPositionLabel: UILabel! = UILabel()
  
  struct PlayerCellLabelProps {
    static let positionLabelOpacity: CGFloat = 0.5
    static let teamLabelOpacity: CGFloat = 0.5
  }
  

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder)")
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    updateUI()
  }
  

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

  }

  func updateUI() {
    playerNameLabel.textColor = UIColor.black
    
    playerRankLabel.textColor = UIColor.black
    playerRankLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    playerTeamLabel.textColor = UIColor.black.withAlphaComponent(PlayerCellLabelProps.positionLabelOpacity)
    
    playerPositionLabel.textColor = UIColor.black.withAlphaComponent(PlayerCellLabelProps.teamLabelOpacity)
    
    contentView.addSubview(playerNameLabel)
    contentView.addSubview(playerRankLabel)
    contentView.addSubview(playerTeamLabel)
    contentView.addSubview(playerPositionLabel)
    
    addConstraints()
  }
  
  func addConstraints() {
    playerRankLabel.translatesAutoresizingMaskIntoConstraints = false
    playerRankLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
    playerRankLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    
    playerNameLabel.translatesAutoresizingMaskIntoConstraints = false
    playerNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    playerNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
    
    playerTeamLabel.translatesAutoresizingMaskIntoConstraints = false
    playerTeamLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    playerTeamLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15).isActive = true
    
    playerPositionLabel.translatesAutoresizingMaskIntoConstraints = false
    playerPositionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                 constant: 150).isActive = true
    playerPositionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 15).isActive = true
  }
}
