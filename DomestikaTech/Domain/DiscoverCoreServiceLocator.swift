//
//  DiscoverCoreServiceLocator.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import Foundation

class DiscoverCoreServiceLocator: BaseCoreServiceLocator {

    func provideCoursesRepository() -> CoursesFetchableRepository {
        return CoursesFetcherRepository(restClient: root.api.provideRestClient(baseURL: Constants.baseURL))
    }

    func provideGetCoursesUseCase() -> GetCourses {
        return GetCourses(coursesRepository: provideCoursesRepository())
    }
}
