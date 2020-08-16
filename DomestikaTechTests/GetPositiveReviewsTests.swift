//
//  GetPositiveReviewsTests.swift
//  DomestikaTechTests
//
//  Created by Jmorgaz on 16/08/2020.
//

import XCTest
@testable import DomestikaTech

class GetPositiveReviewsTests: XCTestCase {

    var getPositiveReviews: GetPositiveReviews!

    override func setUpWithError() throws {
        getPositiveReviews = AppServiceLocator.shared.core.detail.provideGetPositiveReviewsUseCase()
    }

    func testGetPositiveReviews() throws {
        let positivePercentage = getPositiveReviews.exec(positive: 30, total: 50)
        XCTAssertEqual(positivePercentage, 60)
    }
}
