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
    let getCoursesUseCase = GetCourses(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: Constants.baseURL)))
    let getImageUseCase = GetImage(coursesRepository: CoursesFetcherRepository(restClient: RestClient(baseUrl: Constants.baseURL)))
    let discoverView = DiscoverView(viewModel: DiscoverViewModel(getCoursesUseCase: getCoursesUseCase, getImageUseCase: getImageUseCase))
    
    return AnyView(discoverView)
}
