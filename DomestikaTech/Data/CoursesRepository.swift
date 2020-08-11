//
//  CoursesRepository.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine

protocol CoursesFetchableRepository {
    func fetchCourseList() -> AnyPublisher<[Course], Error>
    func fetchImage(url: URL) -> AnyPublisher<Data, URLError>
}

class CoursesFetcherRepository {
    let restClient: RestClient
    
    init(restClient: RestClient) {
        self.restClient = restClient
    }
}

extension CoursesFetcherRepository: CoursesFetchableRepository {
    func fetchCourseList() -> AnyPublisher<[Course], Error> {
        return restClient.perform(DomestikaAPIRouter.courses)
    }
    
    func fetchImage(url: URL) -> AnyPublisher<Data, URLError> {
        return restClient.load(url: url)
    }
}
