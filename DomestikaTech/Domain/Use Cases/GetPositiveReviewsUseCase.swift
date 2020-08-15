//
//  GetPositiveReviewsUseCase.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

protocol GetPositiveReviewsUseCase {
    func exec() -> Double
}

class GetPositiveReviews : GetPositiveReviewsUseCase {
    
    private let positive: Int
    private let total: Int
    
    init(positive: Int, total: Int) {
        self.positive = positive
        self.total = total
    }
    
    func exec() -> Double {
        let percentage = Double(positive) / Double(total) * 100
        return round(percentage * 10) / 10
    }
}
