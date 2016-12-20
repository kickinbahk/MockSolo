//
//  PlayerRanksDictionary.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/7/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Player {
  var rank: Int
  var name: String
  var positions: [String]
  var team: String
  var eligiblePositions: [String]
  
    
  init(rank: Int, name: String, positions: [String], team: String, eligiblePositions: [String]) {
    self.rank = rank
    self.name = name
    self.positions = positions
    self.team = team
    self.eligiblePositions = eligiblePositions
  }
    
  
}











