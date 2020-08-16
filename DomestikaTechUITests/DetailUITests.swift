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
        XCTAssertTrue(app.staticTexts["50 Lessons"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["161905 Students"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["Audio: Spanish"].waitForExistence(timeout: 0))
        XCTAssertTrue(app.staticTexts["English, Spanish, Portuguese"].waitForExistence(timeout: 0))
        XCTAssertEqual(app.staticTexts["DetailLevel"].label, "BEGINNER")
    }

    func testShowImageVideoOverlay() {
        let app = UtilsUITest.getApplication()
        let addButton = app.buttons["Watch"]
        addButton.tap()

        XCTAssertTrue(app.images["VideoOverlayImage"].waitForExistence(timeout: 0))
    }
    
    func testNotShowImageVideoOverlay() {
        if isReadyToTest() {
            let app = UtilsUITest.getApplication()
            let addButton = app.buttons["Watch"]
            addButton.tap()
            sleep(5)

            XCTAssertFalse(app.images["VideoOverlayImage"].waitForExistence(timeout: 0))
        }
    }

    func testShowVideoControls() {
        if isReadyToTest() {
            let app = UtilsUITest.getApplication()
            let addButton = app.buttons["Watch"]
            addButton.tap()
            sleep(5)

            let videoPlayer = app.buttons["VideoPlayer"]
            videoPlayer.tap()

            XCTAssertFalse(app.images["BackwardButtonImage"].waitForExistence(timeout: 2))
        }
    }
}

private func isConnectedToInternet() -> Bool {
    let hostname = "google.com"
    let hostinfo = gethostbyname2(hostname, AF_INET6)
    return hostinfo != nil
}

private func isRunningInDevice() -> Bool {
    return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] == nil
}

private func isReadyToTest() -> Bool {
    return isConnectedToInternet() && isRunningInDevice()
}
