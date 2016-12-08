//
//  PlayerRanksDictionary.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/7/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Players: NSObject {
  let espnTopPlayerList: [Int: [String: Any]]
    
  override init() {
    espnTopPlayerList = [
    1: ["name": "Carlos Correa", "position": ["SS"], "team": "CHC"],
    2: ["name": "Clayton Kershaw", "position": ["SP"], "team": "LAD"],
    3: ["name": "Jonathan Villar", "position": ["SS", "2B", "3B"], "team": "MIL"]
    
    ]
  }
    
  
}
