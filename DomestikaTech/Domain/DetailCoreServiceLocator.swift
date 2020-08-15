//
//  DetailCoreServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class DetailCoreServiceLocator: BaseCoreServiceLocator {
    
    func provideGetPositiveReviewsUseCase() -> GetPositiveReviews {
        return GetPositiveReviews()
    }
}
