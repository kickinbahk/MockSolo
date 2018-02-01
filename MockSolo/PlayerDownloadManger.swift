//
//  PlayerDownloadManger.swift
//  MockSolo
//
//  Created by Josiah Mory on 2/1/18.
//  Copyright © 2018 kickinbahk Productions. All rights reserved.
//

import Foundation
import Firebase

class PlayerDownloadManger {
    let db = Firestore.firestore()
    var playerArray = [Player]()
    
    func downloadData() {
        db.collection("espn-top-300-ranks").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    // print("\(document.documentID) => \(document.data())")
                    self.playerArray.append(self.parse(id: document.documentID, dictionary: document.data()))
                    
                }
            }
        }
    }
    
    func parse(id: String?, dictionary: [String: Any]) -> Player {
        var rank = 0
        var playerName = ""
        var playerPositions = [String]()
        var playerTeam = ""
        var playerEligiblePositions = [String]()

        if let playerId = id {
            if let playerRank = Int(playerId) {
                rank = playerRank
            }
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
