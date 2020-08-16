//
//  DomestikaTechApp.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI
import OHHTTPStubs

@main
struct DomestikaTechApp: App {
    
    var body: some Scene {
        WindowGroup {
            buildContentView()
        }
    }
}

func buildContentView() -> AnyView {
    #if DEBUG
    if CommandLine.arguments.contains("enable-testing") {
        MockData.configureTestingState()
    }
    #endif

    let discoverView = AppServiceLocator.shared.discover.provideDiscoverView()
    return AnyView(discoverView)
}
