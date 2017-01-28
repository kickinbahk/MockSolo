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
  
  // - MARK: Tests for 10 Teams
  
  func testCorrectNumberofPlayersAreRemovedFrom5SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 5
    draft.numberOfDrafters = 10
    let secondPickPosition = 16
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom1SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 10
    let secondPickPosition = 20
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom8SpotWith10Teams() {
    let draft = Draft()
    draft.draftPickNumber = 8
    draft.numberOfDrafters = 10
    let secondPickPosition = 13
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  // - MARK: Tests for 12 Teams
  
  func testCorrectNumberofPlayersAreRemovedFrom6SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 6
    draft.numberOfDrafters = 12
    let secondPickPosition = 19
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom1SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 1
    draft.numberOfDrafters = 12
    let secondPickPosition = 24
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom12SpotWith12Teams() {
    let draft = Draft()
    draft.draftPickNumber = 12
    draft.numberOfDrafters = 12
    let secondPickPosition = 13
    draft.startDraft()
    draft.removePreviousPlayers()
    let secondPick = draft.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  

  
  
  
  
  
}
