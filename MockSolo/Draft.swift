//
//  Draft.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/27/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

let playerArrayDidUpdateNotification = "playerArrayDidUpdateNotification"

class Draft {

    var draftPickNumber: Int
    var roster: Roster
    var players: [Player]
    var numberOfDrafters: Int
    var count = 1
    var loadedPlayers = [String: AnyObject]()


    init(_ playersArray: [Player], draftPosition: Int, numberOfTeams: Int) {
        print("Draft Init")

        self.draftPickNumber = draftPosition
        self.numberOfDrafters = numberOfTeams
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

        self.players = playersArray
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
        print(players)
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

        // TODO: reinitiate player list?
    }

}
