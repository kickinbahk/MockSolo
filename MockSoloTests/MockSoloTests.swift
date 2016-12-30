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
  
  let playerList = DraftManager.sharedInstance.players
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
    XCTAssertNotNil(playerList)
  }
  
  func testRosterHasValues() {
    XCTAssertNotNil(roster)
  }
  
  
}
