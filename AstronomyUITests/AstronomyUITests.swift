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
    
    func testPermitPhotoLibraryAccess() {
        
        // NOTE ====================
        // Only returns true on first run of app when system requests photo library access
        
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

        app.collectionViews.children(matching: .cell).element(boundBy: 1).images["CollectionView.Image"].tap()
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
    
    func testGoForwardAndBackOneSol() {
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
        app.navigationBars["Sol 16"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
    }
    
    func testAddToNavigationStack() {
        app.collectionViews.children(matching: .cell).element(boundBy: 1).images["CollectionView.Image"].tap()
        XCTAssertTrue(app.navigationBars["Title"].exists)
    }
    
    func testPopFromNavigationStack() {
        app.collectionViews.children(matching: .cell).element(boundBy: 1).images["CollectionView.Image"].tap()
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
    }
}
