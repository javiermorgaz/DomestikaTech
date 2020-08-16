//
//  DiscoverUITests.swift
//  DomestikaTechUITests
//
//  Created by Jmorgaz on 11/08/2020.
//

import XCTest
import SwiftUI
import OHHTTPStubs
@testable import DomestikaTech

class DiscoverUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testWatchButtonNavigationToDetail() throws {
        let app = UtilsUITest.getApplication()
        let addButton = app.buttons["Watch"]
        addButton.tap()
        
        XCTAssertTrue(app.staticTexts["DetailTitle"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introduction to Adobe Photoshop")
    }
    
    func testCourseGridButtonNavigationToDetail() throws {
        let app = UtilsUITest.getApplication()
        let courseGridButton = app.buttons["Course537"]
        courseGridButton.tap()
        
        XCTAssertTrue(app.staticTexts["DetailTitle"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introducción a Adobe Premiere Pro")
    }
    
    func testWatchButtonNavigationToDetailInSecondTabCourse() throws {
        let app = UtilsUITest.getApplication()
        let tabScroll = app.collectionViews["TabViewScroll"]
        tabScroll.swipeLeft()
        
        let addButton = app.buttons["Watch"]
        addButton.tap()
        
        XCTAssertTrue(app.staticTexts["DetailTitle"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introduction to Adobe Illustrator")
    }
    
    func testCourseGridButtonNavigationToDetailInThirdGridCourse() throws {
        let app = UtilsUITest.getApplication()
        let tabScroll = app.scrollViews["GridScroll"]
        tabScroll.swipeLeft()
        
        let courseGridButton = app.buttons["Course587"]
        courseGridButton.tap()
        
        XCTAssertTrue(app.staticTexts["DetailTitle"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introduction to Adobe InDesign")
    }
}
