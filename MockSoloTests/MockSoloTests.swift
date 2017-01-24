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
    let draft = DraftManager.sharedInstance
    let position = draft.draftPickNumber
    draft.startDraft()
    let startingPlayer = draft.players[0]
    
    XCTAssertEqual(position, startingPlayer.rank)
  }
  
  func testGivenNonDefaultNumberStartDraftRemovesCorrectNumberOfPlayers() {
    let draft = DraftManager.sharedInstance
    draft.draftPickNumber = 2
    let position = draft.draftPickNumber
    draft.startDraft()
    let startingPlayer = draft.players[0]
    
    XCTAssertEqual(position, startingPlayer.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom5SpotWith10Teams() {
    DraftManager.sharedInstance.draftPickNumber = 5
    DraftManager.sharedInstance.numberOfDrafters = 10
    let secondPickPosition = 16
    DraftManager.sharedInstance.startDraft()
    DraftManager.sharedInstance.removePreviousPlayers()
    let secondPick = DraftManager.sharedInstance.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
  }
  
  func testCorrectNumberofPlayersAreRemovedFrom1SpotWith10Teams() {
    DraftManager.sharedInstance.draftPickNumber = 1
    DraftManager.sharedInstance.numberOfDrafters = 10
    let secondPickPosition = 20
    DraftManager.sharedInstance.startDraft()
    DraftManager.sharedInstance.removePreviousPlayers()
    let secondPick = DraftManager.sharedInstance.players[0]
    
    XCTAssertEqual(secondPickPosition, secondPick.rank)
    
  }
  
}
