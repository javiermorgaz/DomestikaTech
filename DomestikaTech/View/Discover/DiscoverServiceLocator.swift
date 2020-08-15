//
//  DiscoverServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class DiscoverServiceLocator: BaseServiceLocator {
    
    private func provideDiscoverViewModel() -> DiscoverViewModel {
        return DiscoverViewModel(getCoursesUseCase: root.core.discover.provideGetCoursesUseCase())
    }
    
    func provideDiscoverView() -> DiscoverView {
        return DiscoverView(viewModel: provideDiscoverViewModel())
    }
}
