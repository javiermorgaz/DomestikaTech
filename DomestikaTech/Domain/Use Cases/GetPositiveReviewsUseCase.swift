//
//  GetPositiveReviewsUseCase.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

protocol GetPositiveReviewsUseCase {
    func exec(positive: Int, total: Int) -> Double
}

class GetPositiveReviews : GetPositiveReviewsUseCase {

    func exec(positive: Int, total: Int) -> Double {
        let percentage = Double(positive) / Double(total) * 100
        return round(percentage * 10) / 10
    }
}
