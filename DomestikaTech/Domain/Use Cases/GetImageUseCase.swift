//
//  GetImageUseCase.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine

protocol GetImageUseCase {
    func exec(url: URL) -> AnyPublisher<Data, URLError>
}

class GetImage: GetImageUseCase {
    
    private let coursesRepository: CoursesFetchableRepository
    
    init(coursesRepository: CoursesFetchableRepository) {
        self.coursesRepository = coursesRepository
    }
    
    func exec(url: URL) -> AnyPublisher<Data, URLError> {
        coursesRepository.fetchImage(url: url)
    }
}
