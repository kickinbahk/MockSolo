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
  }
}
