//
//  PlayerCell.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
  var playerNameLabel: UILabel!

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder)")
  }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    playerNameLabel = UILabel()
    
    let labelHeight: CGFloat = 30
    let labelWidth: CGFloat = 70
    
    playerNameLabel.frame = CGRect(x: 20, y: 5, width: labelWidth, height: labelHeight)
    playerNameLabel.textColor = UIColor.black
    contentView.addSubview(playerNameLabel)
  }
  

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

}
