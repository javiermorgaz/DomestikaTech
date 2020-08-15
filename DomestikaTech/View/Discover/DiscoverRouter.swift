//
//  DiscoverRouter.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import SwiftUI

enum DiscoverRoute {
    case detailView(course: Course)
}

struct DiscoverRouter: Router {
    typealias Route = DiscoverRoute
    
    func navigationView<T>(route: DiscoverRoute, content: () -> T) -> AnyView where T : View {
        switch route {
        case .detailView(let course):
            let detailView = AppServiceLocator.shared.detail.provideDetailView(course: course)
            return AnyView(NavigationLink(destination: detailView) {
                content()
            })
        }
    }
}
