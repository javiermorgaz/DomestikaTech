//
//  DomestikaTechApp.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import SwiftUI

@main
struct DomestikaTechApp: App {
    var body: some Scene {
        WindowGroup {
            buildContentView()
        }
        
    }
}

func buildContentView() -> AnyView {
    let discoverView = AppServiceLocator.shared.discover.provideDiscoverView()
    
    return AnyView(discoverView)
}
