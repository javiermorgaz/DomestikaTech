//
//  DiscoverViewModel.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine

class DiscoverViewModel: ObservableObject {
    
    @Published var courseItemsViewModel =  [CourseItemViewModel]()
    @Published var isLoaded = false
    
    private let getCoursesUseCase: GetCoursesUseCase
    private let getImageUseCase: GetImageUseCase
    private var cancellable = Set<AnyCancellable>()
    
    init(getCoursesUseCase: GetCoursesUseCase, getImageUseCase: GetImageUseCase) {
        self.getCoursesUseCase = getCoursesUseCase
        self.getImageUseCase = getImageUseCase
    }
        
    func getCourses() {
        
        getCoursesUseCase.exec()
            .receive(on: DispatchQueue.main)
            .map { courses in courses.map { CourseItemViewModel(course: $0, getImageUseCase: self.getImageUseCase) }}
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    self.courseItemsViewModel = []
                }
            }, receiveValue: { courses in
                self.courseItemsViewModel = courses
            })
            .store(in: &cancellable)
    }
}