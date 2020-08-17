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

    private (set) var course: Course

    init(course: Course) {
        self.course = course
    }

    var id: String {
        return course.courseId
    }

    var title: String {
        return course.title
    }

    var teacherName: String {
        return String.localizedStringWithFormat(NSLocalizedString("de", comment: ""), course.teacher.name)
    }

    var image: URL {
        return URL(string: course.thumbnail) ?? URL(string: "")!
    }
}
