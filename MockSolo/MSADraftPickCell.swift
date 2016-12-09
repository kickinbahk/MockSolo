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
  
  struct DraftPicksPositionLabelProps {
    static let labelWidth: CGFloat = 15
    static let labelHeight: CGFloat = 30
    static let labelX: CGFloat = 20
    static let labelY: CGFloat = 18
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder")
  }

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    draftPicksPositionLabel.frame = CGRect(x: DraftPicksPositionLabelProps.labelX,
                                           y: DraftPicksPositionLabelProps.labelY,
                                           width: DraftPicksPositionLabelProps.labelWidth,
                                           height: DraftPicksPositionLabelProps.labelHeight)
    draftPicksPositionLabel.textColor = UIColor.black
    draftPicksPositionLabel.font = UIFont.boldSystemFont(ofSize: 17)
    
    contentView.addSubview(draftPicksPositionLabel)
  }
}
