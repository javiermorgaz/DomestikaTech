//
//  MockData.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 16/08/2020.
//

import Foundation
import OHHTTPStubs

class MockData {

    static func configureTestingState() {
        let bundle = Bundle(for: self)
        let filePath = bundle.path(forResource: "home", ofType: "json")!

        stub(condition: isHost("mobile-assets.domestika.org")) { _ in
          return fixture(filePath: filePath, headers: ["Content-Type": "application/json"])
        }
    }
}
