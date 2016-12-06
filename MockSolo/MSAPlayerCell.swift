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
  var playerPositionLabel: UILabel! = UILabel ()
  
  struct PlayerNameLabelDimensions {
    static let labelWidth: CGFloat = 70
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 60
    static let labelY: CGFloat = 12
  }
  
  struct PlayerRankLabelDimensions {
    static let labelWidth: CGFloat = 15
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 20
    static let labelY: CGFloat = 18
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder)")
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    playerRankLabel.frame = CGRect(x: PlayerRankLabelDimensions.labelX,
                                   y: PlayerRankLabelDimensions.labelY,
                                   width: PlayerRankLabelDimensions.labelWidth,
                                   height: PlayerRankLabelDimensions.labelHeight)
    playerRankLabel.textColor = UIColor.black
    playerRankLabel.font = UIFont.boldSystemFont(ofSize: 20)
    
    playerNameLabel.frame = CGRect(x: PlayerNameLabelDimensions.labelX,
                                   y: PlayerNameLabelDimensions.labelY,
                                   width: PlayerNameLabelDimensions.labelWidth,
                                   height: PlayerNameLabelDimensions.labelHeight)
    playerNameLabel.textColor = UIColor.black
    
    contentView.addSubview(playerRankLabel)
    contentView.addSubview(playerNameLabel)
  }
  

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
