//
//  Draft.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/27/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Draft {
  var playerArray = [Player]()
  
  var draftPickNumber: Int
  var roster: Roster
  var players = [Player]()
  var numberOfDrafters: Int
  var count = 1
  var fileToLoad = "Espn2017Top300"
  var loadedPlayers = [String: AnyObject]()
  
  init() {
    self.draftPickNumber = 5
    self.numberOfDrafters = 10
    self.roster = Roster([["C": ""],
                    ["1B": ""],
                    ["2B": ""],
                    ["SS": ""],
                    ["2B/SS": ""],
                    ["3B": ""],
                    ["1B/3B": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["Util": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["Bench": ""],
                    ["Bench": ""],
                    ["Bench": ""]])

    if let jsonDictionary = self.parse(json: self.performLoad(with: fileToLoad)!) {
     playerArray = parse(dictionary: jsonDictionary)
    }
    
    self.players = playerArray

  }
  
  func removePreviousPlayers() {
    
    if count % 2 == 0 {
      let amountToRemove = (draftPickNumber * 2) - 1
      print("number to remove: \(amountToRemove)")
      for _ in 0..<amountToRemove {
        players.remove(at: 0)
      }
    } else if count % 2 != 0 {
      let amountToRemove = ((numberOfDrafters - draftPickNumber) * 2)
      print(amountToRemove)
      for _ in 0...amountToRemove {
        players.remove(at: 0)
      }
    }
    

    count += 1
    print(players)
  }
  
  func startDraft() {
    let amountToRemove = draftPickNumber - 1
    
    for _ in 0..<amountToRemove {
      players.remove(at: 0)
    }
  }
  
  func newDraft() {
    draftPickNumber = 5
    numberOfDrafters = 10
    roster = Roster([["C": ""],
                    ["1B": ""],
                    ["2B": ""],
                    ["SS": ""],
                    ["2B/SS": ""],
                    ["3B": ""],
                    ["1B/3B": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["OF": ""],
                    ["Util": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["P": ""],
                    ["Bench": ""],
                    ["Bench": ""],
                    ["Bench": ""]])
    
    if let jsonDictionary = self.parse(json: self.performLoad(with: fileToLoad)!) {
      playerArray = parse(dictionary: jsonDictionary)
    }
    
    players = playerArray
  }
  
  func performLoad(with file: String) -> String? {
    guard let url = Bundle.main.url(forResource: file, withExtension: "json") else { return nil }
    
    do {
      return try String(contentsOf: url, encoding: .utf8)
    } catch {
      print("Download Error: \(error)")
      return nil
    }
  }
  
  func parse(json: String) -> [String: Any]? {
    guard let data = json.data(using: .utf8, allowLossyConversion: false) else { return nil }
    
    do {
      return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    } catch {
      print("JSON Error: \(error)")
      return nil
    }
  }
  
  func parse(dictionary: [String: Any]) -> [Player] {
    var array = [Player]()
    let numberOfItems = dictionary.count + 1
    var playerName: String = ""
    var playerPositions = [String]()
    var playerTeam: String = ""
    var playerEligiblePositions = [String]()
    
    for rank in 1..<numberOfItems {
      let item = dictionary.first(where: { Int($0.key) == rank })!.value as! [String: AnyObject]
      
      if let name = item["name"] {
        playerName = name as! String
      }
      if let positions = item["positions"] {
        playerPositions = positions as! [String]
      }
      if let team = item["team"] {
        playerTeam = team as! String
      }
      if let eligiblePositions = item["eligiblePositions"] {
        playerEligiblePositions = eligiblePositions as! [String]
      }
      
      array.append(Player(rank: rank, name: playerName, positions: playerPositions,
                          team: playerTeam, eligiblePositions: playerEligiblePositions))
    }
    
    return array
  }

}
