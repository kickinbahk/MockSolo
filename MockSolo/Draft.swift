//
//  Draft.swift
//  MockSolo
//
//  Created by Josiah Mory on 12/27/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Foundation

class Draft {
  var draftPickNumber: Int
  var roster: Roster
  var players: [Player]
  var numberOfDrafters: Int

  
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
    
    self.players = [Player(rank: 1, name: "Mike Trout", positions: ["OF"],
                          team: "LAA", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 2, name: "Paul Goldschmidt", positions: ["1B"],
                          team: "ARI", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 3, name: "Bryce Harper", positions: ["OF"],
                          team: "WAS", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 4, name: "Clayton Kershaw", positions: ["SP"],
                          team: "LAD", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 5, name: "Josh Donaldson", positions: ["3B"],
                          team: "TOR", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 6, name: "Giancarlo Stanton", positions: ["OF"],
                          team: "MIA", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 7, name: "Manny Machado", positions: ["3B"],
                          team: "BAL", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 8, name: "Andrew McCutchen", positions: ["OF"],
                          team: "PIT", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 9, name: "Nolan Arenado", positions: ["3B"],
                          team: "COL", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 10, name: "Carlos Correa", positions: ["SS"],
                          team: "HOU", eligiblePositions: ["SS", "Util", "Bench"]),
                          Player(rank: 11, name: "Jose Altuve", positions: ["2B"],
                          team: "HOU", eligiblePositions: ["2B", "2B/SS", "Util", "Bench"]),
                          Player(rank: 12, name: "Anthony Rizzo", positions: ["1B"],
                          team: "CHC", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 13, name: "Jose Bautista", positions: ["OF"],
                          team: "TOR", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 14, name: "Kris Bryant", positions: ["3B"],
                          team: "CHC", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 15, name: "Miguel Cabrera", positions: ["1B"],
                          team: "DET", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 16, name: "Edwin Encarnacion", positions: ["1B"],
                          team: "TOR", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 17, name: "Mookie Betts", positions: ["OF"],
                          team: "BOS", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 18, name: "Dee Gordon", positions: ["2B"],
                          team: "MIA", eligiblePositions: ["2B", "2B/SS", "Util", "Bench"]),
                          Player(rank: 19, name: "Max Scherzer", positions: ["SP"],
                          team: "WAS", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 20, name: "Jose Abreu", positions: ["1B"],
                          team: "CWS", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 21, name: "Jake Arrieta", positions: ["SP"],
                          team: "CHC", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 22, name: "Chris Sale", positions: ["SP"],
                          team: "CWS", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 23, name: "Starling Marte", positions: ["OF"],
                          team: "PIT", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 24, name: "David Price", positions: ["SP"],
                          team: "BOS", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 25, name: "Charlie Blackmon", positions: ["OF"],
                          team: "COL", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 26, name: "Madision Bumgarner", positions: ["SP"],
                          team: "SF", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 27, name: "J.D. Martinez", positions: ["OF"],
                          team: "DET", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 28, name: "Joey Votto", positions: ["1B"],
                          team: "CIN", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 29, name: "Gerrit Cole", positions: ["SP"],
                          team: "PIT", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 30, name: "George Springer", positions: ["OF"],
                          team: "HOU", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 31, name: "Corey Kluber", positions: ["SP"],
                          team: "CLE", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 32, name: "Buster Posey", positions: ["C", "1B"],
                          team: "SF", eligiblePositions: ["C", "1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 33, name: "Chris Davis", positions: ["1B", "OF"],
                          team: "BAL", eligiblePositions: ["1B", "1B/3B", "OF", "Util", "Bench"]),
                          Player(rank: 34, name: "Jacob DeGrom", positions: ["SP"],
                          team: "NYM", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 35, name: "Matt Harvey", positions: ["SP"],
                          team: "NYM", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 36, name: "Todd Frazier", positions: ["3B"],
                          team: "CWS", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 37, name: "Chris Archer", positions: ["SP"],
                          team: "TB", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 38, name: "Robinson Cano", positions: ["2B"],
                          team: "SEA", eligiblePositions: ["2B", "Util", "Bench"]),
                          Player(rank: 39, name: "Justin Upton", positions: ["OF"],
                          team: "DET", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 40, name: "Zack Greinke", positions: ["SP"],
                          team: "ARI", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 41, name: "Dallas Keuchel", positions: ["SP"],
                          team: "HOU", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 42, name: "Adrian Gonzalez", positions: ["1B"],
                          team: "LAD", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 43, name: "Stephen Strasburg", positions: ["SP"],
                          team: "WAS", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 44, name: "Carlos Gonzalez", positions: ["OF"],
                          team: "COL", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 45, name: "Nelson Cruz", positions: ["OF"],
                          team: "SEA", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 46, name: "Jose Fernandez", positions: ["SP"],
                          team: "MIA", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 47, name: "Yoenis Cespedes", positions: ["OF"],
                          team: "NYM", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 48, name: "Lorenzo Cain", positions: ["OF"],
                          team: "KC", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 49, name: "Sonny Gray", positions: ["SP"],
                          team: "OAK", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 50, name: "Ryan Braun", positions: ["OF"],
                          team: "MIL", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 51, name: "Xander Bogaerts", positions: ["SS"],
                          team: "BOS", eligiblePositions: ["SS", "2B/SS", "Util", "Bench"]),
                          Player(rank: 52, name: "Carlos Gomez", positions: ["OF"],
                          team: "HOU", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 53, name: "Matt Carpenter", positions: ["3B"],
                          team: "STL", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 54, name: "Troy Tulowitzki", positions: ["SS"],
                          team: "TOR", eligiblePositions: ["SS", "2B/SS", "Util", "Bench"]),
                          Player(rank: 55, name: "Adam Jones", positions: ["OF"],
                          team: "BAL", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 56, name: "Adam Wainwright", positions: ["SP"],
                          team: "STL", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 57, name: "Jason Heyward", positions: ["OF"],
                          team: "CHC", eligiblePositions: ["OF", "Util", "Bench"]),
                          Player(rank: 58, name: "Prince Fielder", positions: ["DH"],
                          team: "TEX", eligiblePositions: ["Util", "Bench"]),
                          Player(rank: 59, name: "Noah Syndergaard", positions: ["SP"],
                          team: "NYM", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 60, name: "Miguel Sano", positions: ["DH"],
                          team: "MIN", eligiblePositions: ["Util", "Bench"]),
                          Player(rank: 61, name: "Kyle Seager", positions: ["3B"],
                          team: "SEA", eligiblePositions: ["3B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 62, name: "Carlos Carrasco", positions: ["SP"],
                          team: "CLE", eligiblePositions: ["SP", "P", "Bench"]),
                          Player(rank: 63, name: "Eric Hosmer", positions: ["1B"],
                          team: "KC", eligiblePositions: ["1B", "1B/3B", "Util", "Bench"]),
                          Player(rank: 64, name: "Kenley Jansen", positions: ["RP"],
                          team: "LAD", eligiblePositions: ["RP", "P", "Bench"]),
                          Player(rank: 65, name: "Craig Kimbrel", positions: ["RP"],
                          team: "BOS", eligiblePositions: ["RP", "P", "Bench"])]
    
  }
  
  func removePreviousPlayers() {
    let amountToRemove = numberOfDrafters - 1
    
    for num in 0...amountToRemove {
      print(num)
      players.remove(at: 0)
    }
    
    print(players)
  }
  
}
