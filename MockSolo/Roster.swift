//
//  Roster.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/19/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Roster {
  var rosterPositions: [String: String]

  init(_ roster: [String: String]) {
    self.rosterPositions = roster
  }
  
  func checkPosition(isOpen position: String, roster: [String: String]) -> Bool {
    let checkedPosition = roster[position]
    if checkedPosition == "" {
      print("\(position)'s value is \(checkedPosition): true")
      return true
    } else {
      print("\(position)'s value is \(checkedPosition): false")
      return false
    }
  }
}
