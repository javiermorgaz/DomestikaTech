//
//  AppCoreServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class BaseCoreServiceLocator {
    weak var root: AppCoreServiceLocator!
}

class AppCoreServiceLocator {
    private(set) static var shared = AppCoreServiceLocator.Builder().build()

    let api: APIServiceLocator
    let discover: DiscoverCoreServiceLocator
    let detail: DetailCoreServiceLocator

    init(api: APIServiceLocator,
         discover: DiscoverCoreServiceLocator,
         detail: DetailCoreServiceLocator
    ) {
        self.api = api
        self.discover = discover
        self.detail = detail

        api.root = self
        discover.root = self
        detail.root = self
    }
}

extension AppCoreServiceLocator {

    class Builder {
        private var api = APIServiceLocator()
        private var discover = DiscoverCoreServiceLocator()
        private var detail = DetailCoreServiceLocator()

        //Gives the feature to mock in tests
        func with(api: APIServiceLocator) -> Builder {
            self.api = api
            return self
        }

        func build() -> AppCoreServiceLocator {
            return AppCoreServiceLocator(api: api,
                                         discover: discover,
                                         detail: detail)
        }
    }
}
