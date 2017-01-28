//
//  MockSoloTests.swift
//  MockSoloTests
//
//  Created by Josiah Mory on 12/5/16.
//  Copyright © 2016 kickinbahk Productions. All rights reserved.
//

import XCTest
@testable import MockSolo

class MockSoloTests: XCTestCase {
  
  let roster = DraftManager.sharedInstance.roster
  
  override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
  }
  
  func testPlayerListHasValues() {
    XCTAssertNotNil(DraftManager.sharedInstance.players)
  }
  
  func testRosterHasValues() {
    XCTAssertNotNil(roster)
  }
  
  func testStartDraftRemovesCorrectNumberOfPlayers() {
    let draft = Draft()
    let position = draft.draftPickNumber
    draft.startDraft()
    let startingPlayer = draft.players[0]
    
    XCTAssertEqual(position, startingPlayer.rank)
  }
  
  func testGivenNonDefaultNumberStartDraftRemovesCorrectNumberOfPlayers() {
    let draft = Draft()
    draft.draftPickNumber = 2
    let position = draft.draftPickNumber
    draft.startDraft()
    let startingPlayer = draft.players[0]
    
    XCTAssertEqual(position, startingPlayer.rank)
  }
  
  // - MARK: Tests for 8 Teams
  
  func testFirst3PicksAreCorrectFrom4SpotWith8Teams() {
    let draft = Draft()
    draft.draftPickNumber = 4
    draft.numberOfDrafters = 8
    
    let firstPickPosition = 4
    let secondPickPosition = 13
    let thirdPickPosition = 20
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom1SpotWith8Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 8
    
    let firstPickPosition = 1
    let secondPickPosition = 16
    let thirdPickPosition = 17
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom8SpotWith8Teams() {
    let draft = Draft()
    draft.draftPickNumber = 8
    draft.numberOfDrafters = 8
    
    let firstPickPosition = 8
    let secondPickPosition = 9
    let thirdPickPosition = 24
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }

  
  // - MARK: Tests for 10 Teams
  
  func testFirst3PicksAreCorrectFrom5SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 5
    draft.numberOfDrafters = 10
    
    let firstPickPosition = 5
    let secondPickPosition = 16
    let thirdPickPosition = 25
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom1SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 10
    
    let firstPickPosition = 1
    let secondPickPosition = 20
    let thirdPickPosition = 21
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom10SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 10
    draft.numberOfDrafters = 10
    
    let firstPickPosition = 10
    let secondPickPosition = 11
    let thirdPickPosition = 30
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  // - MARK: Tests for 12 Teams
  
  func testFirst3PicksAreCorrectFrom6SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 6
    draft.numberOfDrafters = 12
    
    let firstPickPosition = 6
    let secondPickPosition = 19
    let thirdPickPosition = 30
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom1SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 12
    
    let firstPickPosition = 1
    let secondPickPosition = 24
    let thirdPickPosition = 25
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testFirst3PicksAreCorrectFrom12SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 12
    draft.numberOfDrafters = 12
    
    let firstPickPosition = 12
    let secondPickPosition = 13
    let thirdPickPosition = 36
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  // - MARK: Tests for 16 Teams
  
  func testFirst3PicksAreCorrectFrom8SpotWith16Teams() {
    let draft = Draft()
    draft.draftPickNumber = 8
    draft.numberOfDrafters = 16
    
    let firstPickPosition = 8
    let secondPickPosition = 25
    let thirdPickPosition = 40
    
    draft.startDraft()
    
    let firstPick = draft.players[0]
    XCTAssertEqual(firstPickPosition, firstPick.rank)
    
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
    draft.removePreviousPlayers()
    let thirdPick = draft.players[0]
    XCTAssertEqual(thirdPickPosition, thirdPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom1SpotWith16Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 16
    let secondPickPosition = 32
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom16SpotWith16Teams() {
    let draft = Draft()
    draft.draftPickNumber = 16
    draft.numberOfDrafters = 16
    let secondPickPosition = 17
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }

  
  
  
  
  
  
}
