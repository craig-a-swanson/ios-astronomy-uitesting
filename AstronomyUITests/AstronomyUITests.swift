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
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    // at least 4 tests.
    // test saving a photo
    // test viewing another sol (14-16)
    // test sol label after changing dates
    // maybe test photo detail date by comparing it to sol date from table view?
    
    func testPermitPhotoLibraryAccess() {
        // Only returns true on first run of app when system request photo library access
        
        app.collectionViews.children(matching: .cell).element(boundBy: 6).images["CollectionView.Image"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        addUIInterruptionMonitor(withDescription: "System Dialog") { (alert) -> Bool in
        let photoLibraryPermissionText = "Would Like to Access Your Photos"
            if alert.label.contains(photoLibraryPermissionText) {
                XCTAssertTrue(alert.exists)
                alert.buttons["OK"].tap()
        }
            return true
        }
        app.tap()
    }
    
    func testSavePhoto() {

        app.collectionViews.children(matching: .cell).element(boundBy: 6).images["CollectionView.Image"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        addUIInterruptionMonitor(withDescription: "System Dialog") { (alert) -> Bool in
            let okButton = alert.buttons["OK"]
            if okButton.exists{
                alert.buttons["OK"].tap()
            }
                return true
            }
        
        if app.alerts["Photo Saved!"].exists {
        XCTAssertTrue(app.alerts["Photo Saved!"].exists)
        } else {
            app.tap()
            app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            XCTAssertTrue(app.alerts["Photo Saved!"].exists)
        }
    }
    
    func testGoBackOneSol() {
        XCUIApplication().navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
        XCUIApplication().navigationBars["Sol 16"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
        
    }
    
    func testScrollCollectionView() {
        

    }
}
