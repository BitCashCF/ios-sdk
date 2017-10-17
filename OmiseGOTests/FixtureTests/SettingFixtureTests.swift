//
//  SettingFixtureTests.swift
//  OmiseGOTests
//
//  Created by Mederic Petit on 12/10/2560 BE.
//  Copyright © 2560 OmiseGO. All rights reserved.
//

import XCTest
@testable import OmiseGO

class SettingFixtureTests: FixtureTestCase {

    func testGetSettings() {
        let expectation = self.expectation(description: "Setting result")
        let request = Setting.get(using: self.testCustomClient) { (result) in
            defer { expectation.fulfill() }
            switch result {
            case .success(let setting):
                XCTAssertTrue(setting.tokens.count == 2)
                XCTAssertEqual(setting.tokens[0].symbol, "MNT")
                XCTAssertEqual(setting.tokens[0].name, "Mint")
                XCTAssertEqual(setting.tokens[1].symbol, "OMG")
                XCTAssertEqual(setting.tokens[1].name, "OmiseGO")
            case .fail(let error):
                XCTFail("\(error)")
            }
        }
        XCTAssertNotNil(request)
        waitForExpectations(timeout: 15.0, handler: nil)
    }

}