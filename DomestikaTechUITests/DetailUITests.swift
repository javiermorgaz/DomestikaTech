//
//  DetailUITests.swift
//  DomestikaTechUITests
//
//  Created by Jmorgaz on 16/08/2020.
//

import XCTest
@testable import DomestikaTech

class DetailUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testFirstTabCourse() throws {
        let app = UtilsUITest.getApplication()
        let addButton = app.buttons["Watch"]
        addButton.tap()
        
        XCTAssertTrue(app.staticTexts["DetailTitle"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introduction to Adobe Photoshop")
        XCTAssertEqual(app.staticTexts["DetailDescription"].label, "Learn Adobe Photoshop from scratch and master the best software for treatment, retouching and creation of digital images on the market")
        XCTAssertEqual(app.staticTexts["DetailName"].label, "Carles Marsal")
        XCTAssertEqual(app.staticTexts["DetailLocation"].label, "Barcelona, Spain")
        XCTAssertEqual(app.staticTexts["DetailTitle"].label, "Introduction to Adobe Photoshop")
        XCTAssertTrue(app.staticTexts["97% Positive reviews (4,100)"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["50 Lessons"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["161905 Students"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["Audio: Spanish"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["English, Spanish, Portuguese"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailLevel"].label, "BEGINNER")
    }
}
