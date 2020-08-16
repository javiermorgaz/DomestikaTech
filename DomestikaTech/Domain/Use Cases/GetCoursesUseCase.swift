//
//  GetCoursesUseCase.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine

protocol GetCoursesUseCase {
    func exec() -> AnyPublisher<[Course], Error>
}

class GetCourses: GetCoursesUseCase {

    private let coursesRepository: CoursesFetchableRepository
    
    init(coursesRepository: CoursesFetchableRepository) {
        self.coursesRepository = coursesRepository
    }
    
    func exec() -> AnyPublisher<[Course], Error> {
        coursesRepository.fetchCourseList()
    }
}
