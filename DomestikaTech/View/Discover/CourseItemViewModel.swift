//
//  CourseItemViewModel.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation
import Combine
import SwiftUI

class CourseItemViewModel: Identifiable, ObservableObject {
    
    private let getImageUseCase: GetImageUseCase
    private var cancellable = Set<AnyCancellable>()
    
    private var course: Course
    
    init(course: Course, getImageUseCase: GetImageUseCase) {
        self.course = course
        self.getImageUseCase = getImageUseCase
        
        getImage()
    }
    
    var id: String {
        return course.courseId
    }
    
    var title: String {
        return course.title
    }
    
    var teacherName: String {
        return course.teacher.name
    }
    
    @Published var image: UIImage?
    
    func getImage() {
        guard let url = URL(string: course.thumbnail) else {
            return
        }
        
        getImageUseCase.exec(url: url)
            .receive(on: DispatchQueue.main)
            .map { UIImage(data: $0) }
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { image in
                self.image = image
            })
            .store(in: &cancellable)
    }
}
