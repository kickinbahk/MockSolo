//
//  MockSoloTests.swift
//  MockSoloTests
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import Quick
import Nimble
@testable import MockSolo

class MockSoloTests: QuickSpec {
  override func spec() {
    describe("Player List") {
      beforeEach {
        DraftManager.sharedInstance.newDraft()
      }

      it("has players") {
        expect(DraftManager.sharedInstance.players).to(beAnInstanceOf([Player].self))
      }
    }
    
    describe("Roster") {
      let roster = DraftManager.sharedInstance.roster
      it("has positions") {
        expect(roster).to(beAnInstanceOf(Roster.self))
      }
    }
    
    describe("Start draft") {
      it("removes correct number of players") {
        let draft = Draft()
        let position = draft.draftPickNumber
        draft.startDraft()
        let startingPlayer = draft.players[0]
        
        expect(position).to(equal(startingPlayer.rank))
      }
      
      it("given non-default pick number removes correct number of players") {
        let draft = Draft()
        draft.draftPickNumber = 2
        let position = draft.draftPickNumber
        draft.startDraft()
        let startingPlayer = draft.players[0]
        
        expect(position).to(equal(startingPlayer.rank))
      }
    }
    
    describe("8 team draft") {
      it("first 3 picks are correct from 4 spot") {
        let draft = Draft()
        draft.draftPickNumber = 4
        draft.numberOfDrafters = 8
        
        let firstPickPosition = 4
        let secondPickPosition = 13
        let thirdPickPosition = 20
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 1 spot") {
        let draft = Draft()
        draft.draftPickNumber = 1
        draft.numberOfDrafters = 8
        
        let firstPickPosition = 1
        let secondPickPosition = 16
        let thirdPickPosition = 17
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))

        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 8 spot") {
        let draft = Draft()
        draft.draftPickNumber = 8
        draft.numberOfDrafters = 8
        
        let firstPickPosition = 8
        let secondPickPosition = 9
        let thirdPickPosition = 24
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        XCTAssertEqual(thirdPickPosition, thirdPick.rank)
      }
    }

    describe("10 team draft") {
      it("first 3 picks are correct from 5 spot") {
        let draft = Draft()
        draft.draftPickNumber = 5
        draft.numberOfDrafters = 10
        
        let firstPickPosition = 5
        let secondPickPosition = 16
        let thirdPickPosition = 25
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 1 spot") {
        let draft = Draft()
        draft.draftPickNumber = 1
        draft.numberOfDrafters = 10
        
        let firstPickPosition = 1
        let secondPickPosition = 20
        let thirdPickPosition = 21
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 10 spot") {
        let draft = Draft()
        draft.draftPickNumber = 10
        draft.numberOfDrafters = 10
        
        let firstPickPosition = 10
        let secondPickPosition = 11
        let thirdPickPosition = 30
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
    }
    
    describe("12 team draft") {
      it("first 3 picks are correct from 6 spot") {
        let draft = Draft()
        draft.draftPickNumber = 6
        draft.numberOfDrafters = 12
        
        let firstPickPosition = 6
        let secondPickPosition = 19
        let thirdPickPosition = 30
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 1 spot") {
        let draft = Draft()
        draft.draftPickNumber = 1
        draft.numberOfDrafters = 12
        
        let firstPickPosition = 1
        let secondPickPosition = 24
        let thirdPickPosition = 25
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
      
      it("first 3 picks are correct from 12 spot") {
        let draft = Draft()
        draft.draftPickNumber = 12
        draft.numberOfDrafters = 12
        
        let firstPickPosition = 12
        let secondPickPosition = 13
        let thirdPickPosition = 36
        
        draft.startDraft()
        
        let firstPick = draft.players[0]
        expect(firstPickPosition).to(equal(firstPick.rank))
        
        draft.removePreviousPlayers()
        let secondPick = draft.players[0]
        expect(secondPickPosition).to(equal(secondPick.rank))
        
        draft.removePreviousPlayers()
        let thirdPick = draft.players[0]
        expect(thirdPickPosition).to(equal(thirdPick.rank))
      }
    }

    
    
    
    
    
    
    
  }
}
