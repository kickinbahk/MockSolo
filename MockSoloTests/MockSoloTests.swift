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
    let position = DraftManager.sharedInstance.draftPickNumber
    DraftManager.sharedInstance.startDraft()
    let startingPlayer = DraftManager.sharedInstance.players[0]
    
    XCTAssertEqual(position, startingPlayer.rank)
  }
  
  
}
