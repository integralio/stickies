//
//  StickiesTests.swift
//  StickiesTests
//
//  Created by Stefan on 10/1/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import XCTest
@testable import Stickies

class StickiesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveStickyNote() {
        let exp = expectation(description: "it should save a sticky note")
        let service: HTTPRequestService = MockHTTPRequestService()
        let api = StickiesAPI(service: service)
        let sticky = Sticky(content: "My new sticky note.")

        api.saveSticky(sticky) { (sticky, error) in
            defer { exp.fulfill() }
            XCTAssertNil(error)
            guard let sticky = sticky else {
                XCTFail("Sticky was nil")
                return
            }

            XCTAssertEqual(sticky.content, "My new sticky note.")
            XCTAssertNotNil(sticky.id)
        }

        waitForExpectations(timeout: 0.5) { (error) in
            XCTAssertNil(error)
        }
    }

    func testDeleteStickyNote() {
        let exp = expectation(description: "it should delete a sticky note")
        let service: HTTPRequestService = MockHTTPRequestService()
        let api = StickiesAPI(service: service)

        api.deleteSticky(withId: 1) { (error) in
            defer { exp.fulfill() }

            XCTAssertNil(error)
        }

        waitForExpectations(timeout: 0.5) { (error) in
            XCTAssertNil(error)
        }
    }

}
