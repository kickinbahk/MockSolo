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
  var playerPositionLabel: UILabel! = UILabel ()
  
  struct PlayerNameLabelProps {
    static let labelWidth: CGFloat = 70
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 60
    static let labelY: CGFloat = 12
  }
  
  struct PlayerRankLabelProps {
    static let labelWidth: CGFloat = 15
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 20
    static let labelY: CGFloat = 18
  }
  
  struct PlayerTeamLabelProps {
    static let labelWidth: CGFloat = 70
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 60
    static let labelY: CGFloat = 40
    static let opacity: CGFloat = 0.5
  }
  
  struct PlayerPositionLabelProps {
    static let labelWidth: CGFloat = 70
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 120
    static let labelY: CGFloat = 40
    static let opacity: CGFloat = 0.5
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

    // Configure the view for the selected state
  }

  func updateUI() {
    playerNameLabel.frame = CGRect(x: PlayerNameLabelProps.labelX,
                                   y: PlayerNameLabelProps.labelY,
                                   width: PlayerNameLabelProps.labelWidth,
                                   height: PlayerNameLabelProps.labelHeight)
    playerNameLabel.textColor = UIColor.black
    
    playerRankLabel.frame = CGRect(x: PlayerRankLabelProps.labelX,
                                   y: PlayerRankLabelProps.labelY,
                                   width: PlayerRankLabelProps.labelWidth,
                                   height: PlayerRankLabelProps.labelHeight)
    playerRankLabel.textColor = UIColor.black
    playerRankLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    playerTeamLabel.frame = CGRect(x: PlayerTeamLabelProps.labelX,
                                   y: PlayerTeamLabelProps.labelY,
                                   width: PlayerTeamLabelProps.labelWidth,
                                   height: PlayerTeamLabelProps.labelHeight)
    playerTeamLabel.textColor = UIColor.black.withAlphaComponent(PlayerTeamLabelProps.opacity)
    
    playerPositionLabel.frame = CGRect(x: PlayerPositionLabelProps.labelX,
                                       y: PlayerPositionLabelProps.labelY,
                                       width: PlayerPositionLabelProps.labelWidth,
                                       height: PlayerPositionLabelProps.labelHeight)
    playerPositionLabel.textColor = UIColor.black.withAlphaComponent(PlayerPositionLabelProps.opacity)
    
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
    playerNameLabel.leadingAnchor.constraint(equalTo: playerRankLabel.trailingAnchor, constant: 30).isActive = true
    playerNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
    
    playerTeamLabel.translatesAutoresizingMaskIntoConstraints = false
    playerTeamLabel.leadingAnchor.constraint(equalTo: playerRankLabel.trailingAnchor, constant: 30).isActive = true
    playerTeamLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
  }
}
