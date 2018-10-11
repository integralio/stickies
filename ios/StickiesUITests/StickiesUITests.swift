//
//  StickiesUITests.swift
//  StickiesUITests
//
//  Created by Stefan on 10/1/18.
//  Copyright © 2018 Integral. All rights reserved.
//

import XCTest

class StickiesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenAppLaunches_emptyStateLabelAppears_andStickyNoteViewIsHidden() {
        let app = XCUIApplication()

        // Make sure that the empty state label appears
        let emptyStateLabelQuery = app.descendants(matching: .staticText)
            .matching(identifier: "emptyStateLabel")
        let emptyStateLabelElement = emptyStateLabelQuery.element
        XCTAssertTrue(emptyStateLabelElement.exists)

        // Make sure the sticky note view does not appear
        let stickyNotePaperQuery = app.descendants(matching: .any)
            .matching(identifier: "stickyNotePaper")
        let stickyNotePaperElement = stickyNotePaperQuery.element
        XCTAssertFalse(stickyNotePaperElement.exists)
    }

    func testUserCanEnterAndSaveStickyContent() {
        let app = XCUIApplication()

        // Find the button
        let buttonQuery = app.descendants(matching: .button)
            .matching(identifier: "createStickyButton")
        let buttonElement = buttonQuery.element

        XCTAssertTrue(buttonElement.exists)

        // Tap it
        buttonElement.tap()

        // Find the sticky note input text field
        let inputTextFieldQuery = app.descendants(matching: .textField)
        let inputTextFieldElement = inputTextFieldQuery.element

        XCTAssertTrue(inputTextFieldElement.exists)

        // Type some text in the text field
        let desiredText = UUID().uuidString
        inputTextFieldElement.typeText(desiredText)

        // Hit OK
        let okButtonQuery = app.descendants(matching: .button)
            .matching(identifier: "OK")
        let okButtonElement = okButtonQuery.element
        okButtonElement.tap()

        // Verify what we entered got put in the sticky note label
        let stickyLabelElement = app.descendants(matching: .any)
            .matching(identifier: desiredText).element
        XCTAssertTrue(stickyLabelElement.waitForExistence(timeout: 0.5))
    }

}
