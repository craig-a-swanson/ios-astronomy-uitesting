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
    
    func testScrollCollectionView() {
        
        let verticalScrollBar3PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar3PagesCollectionView.swipeUp()
        verticalScrollBar3PagesCollectionView.swipeUp()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let sol2NavigationBar = app.navigationBars["Sol 2"]
        sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 6).images["CollectionView.Image"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        let sol2Button = app.navigationBars["Title"].buttons["Sol 2"]
        sol2Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).images["CollectionView.Image"].swipeUp()
        sol2Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).images["CollectionView.Image"].swipeUp()
        sol2Button.tap()
        sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 10).images["CollectionView.Image"]/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeUp()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        
    }
}
