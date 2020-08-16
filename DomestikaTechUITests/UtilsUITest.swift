//
//  UtilsUITest.swift
//  DomestikaTechUITests
//
//  Created by Jmorgaz on 16/08/2020.
//

import Foundation
import XCTest

class UtilsUITest {
    
    static func getApplication() -> XCUIApplication {
        var app = XCUIApplication()
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

        return app
    }
}
