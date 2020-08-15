//
//  Router.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation
import SwiftUI

protocol Router {
    associatedtype Route
    func navigationView<T: View>(route: Route, content: () -> T) -> AnyView
}
