//
//  DetailServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class DetailServiceLocator: BaseServiceLocator {
    
    private func provideDetailViewModel(course: Course) -> DetailViewModel {
        return DetailViewModel(course: course, getPositiveReviewsUseCase: root.core.detail.provideGetPositiveReviewsUseCase())
    }
    
    func provideDetailView(course: Course) -> DetailView {
        return DetailView(viewModel: provideDetailViewModel(course: course))
    }
}
