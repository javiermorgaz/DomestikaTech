//
//  GetPositiveReviewsUseCase.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

protocol GetPositiveReviewsUseCase {
    func exec(positive: Int, total: Int) -> Int
}

class GetPositiveReviews: GetPositiveReviewsUseCase {

    func exec(positive: Int, total: Int) -> Int {
        let percentage = Double(positive) / Double(total) * 100
        return Int(percentage)
    }
}
