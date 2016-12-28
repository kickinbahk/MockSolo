//
//  Roster.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/19/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Roster {
  var availablePositions: [[String: String]]

  init(_ availablePositions: [[String: String]]) {
    self.availablePositions = availablePositions
  }
  
  func checkPosition(isOpen positionToCheck: String) -> Bool {
    var checkedPosition = [[String: String]]()
    for position in availablePositions {
      for (key, value) in position {
        if key == positionToCheck && value.isEmpty {
          checkedPosition.append(position)
        }
      }
    }

    if checkedPosition.isEmpty {
      print("\(positionToCheck) has no available spots")
      return false
    } else {
      print("\(positionToCheck) there are available positions")
      return true
    }
  }
}
