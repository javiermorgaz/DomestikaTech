//
//  AppServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class BaseServiceLocator {
    weak var root: AppServiceLocator!
}

class AppServiceLocator {
    private(set) static var shared = AppServiceLocator.Builder().build()
    
    let core: AppCoreServiceLocator
    let discover: DiscoverServiceLocator
    let detail: DetailServiceLocator
    
    init(core: AppCoreServiceLocator,
         discover: DiscoverServiceLocator,
         detail: DetailServiceLocator
    ) {
        self.core = core
        self.discover = discover
        self.detail = detail
        
        discover.root = self
        detail.root = self
    }
}

extension AppServiceLocator {

    class Builder {
        private var core = AppCoreServiceLocator.shared
        private var discover = DiscoverServiceLocator()
        private var detail = DetailServiceLocator()
        
        
        func build() -> AppServiceLocator {
            return AppServiceLocator(core: core,
                                     discover: discover,
                                     detail: detail)
        }
    }
}
