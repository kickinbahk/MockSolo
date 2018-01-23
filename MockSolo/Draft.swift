//
//  Draft.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/27/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation
import Firebase

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
    FirebaseApp.configure()
    let db = Firestore.firestore()
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

    
    db.collection("espn-top-300-ranks").getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
               // print("\(document.documentID) => \(document.data())")
                self.playerArray.append(self.parse(id: document.documentID, dictionary: document.data()))
                
            }
        }
        self.players = self.playerArray
        for player in self.players {
            print("\(player.name) - \(player.rank)")
        }
    }
//    if let jsonDictionary = self.parse(json: self.performLoad(with: fileToLoad)!) {
//     playerArray = parse(dictionary: jsonDictionary)
//    }



  }
  
  func removePreviousPlayers() {
    
    if count % 2 == 0 {
      let amountToRemove = (draftPickNumber * 2) - 1
      print("Even pick number to remove: \(amountToRemove)")
      for _ in 0..<amountToRemove {
        players.remove(at: 0)
      }
    } else if count % 2 != 0 {
      let amountToRemove = ((numberOfDrafters - draftPickNumber) * 2)
      print("Odd pick number to remove: \(amountToRemove)")
      for _ in 0...amountToRemove {
        players.remove(at: 0)
      }
    }

    count += 1
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
    count = 1
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
    
//    if let jsonDictionary = self.parse(json: self.performLoad(with: fileToLoad)!) {
//      playerArray = parse(dictionary: jsonDictionary)
//    }
//
//    players = playerArray
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
  
    func parse(id: String?, dictionary: [String: Any]) -> Player {
        var rank = 0
        var playerName = ""
        var playerPositions = [String]()
        var playerTeam = ""
        var playerEligiblePositions = [String]()
        
        if let playerRank = Int(id!) {
            rank = playerRank
        }

        if let name = dictionary["name"] {
            print("Got Name: \(name)")
            playerName = name as! String
        }
        if let positions = dictionary["positions"] {
            playerPositions = positions as! [String]
            print("Positions: \(playerPositions)")
        }
        if let team = dictionary["team"] {
            playerTeam = team as! String
        }
        if let eligiblePositions = dictionary["eligiblePositions"] {
            playerEligiblePositions = eligiblePositions as! [String]
        }
      
        return Player(rank: rank, name: playerName, positions: playerPositions,
                      team: playerTeam, eligiblePositions: playerEligiblePositions)
    }

}
