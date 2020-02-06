//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Craig Swanson on 2/5/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        app.launch()
        app.launchArguments = ["UITesting"]
    }

    // at least 4 tests.
    // test saving a photo
    // test viewing another sol (14-16)
    func testSavePhoto() {

        app.collectionViews.children(matching: .cell).element(boundBy: 0).images["CollectionView.Image"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
/*
         NOTE: upon first run, tapping on save image brings the alert to allow access to photo library
         attempted to automate with this code, but it did not work
        let photoLibraryAccessAlert = app.alerts["“Astronomy” Would Like to Access Your Photos"].scrollViews.otherElements.buttons["OK"]
        if photoLibraryAccessAlert.exists {
            photoLibraryAccessAlert.tap()
            app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        }
 */
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
}
