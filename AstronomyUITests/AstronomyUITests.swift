//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Craig Swanson on 2/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
    }

    // at least 4 tests.
    // test saving a photo
    // test viewing another sol (14-16)
    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
