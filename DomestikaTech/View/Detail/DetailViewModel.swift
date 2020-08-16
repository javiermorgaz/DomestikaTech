//
//  DetailViewModel.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 13/08/2020.
//

import Foundation
import SwiftUI

struct DetailViewModel {

    private let course: Course
    private let getPositiveReviewsUseCase: GetPositiveReviewsUseCase

    init(course: Course,
         getPositiveReviewsUseCase: GetPositiveReviewsUseCase) {
        self.course = course
        self.getPositiveReviewsUseCase = getPositiveReviewsUseCase
    }

    var title: String {
        return course.title
    }

    var description: String {
        return course.description
    }

    var teacherName: String {
        return course.teacher.name
    }

    var location: String {
        return course.location
    }

    var image: URL {
        return URL(string: course.thumbnail) ?? URL(string: "")!
    }

    var trailer: URL {
        return URL(string: course.trailer) ?? URL(string: "")!
    }

    var avatar: URL {
        return URL(string: course.teacher.avatar) ?? URL(string: "")!
    }

    var positive: String {
        let total = String.localizedStringWithFormat(NSLocalizedString("reviews", comment: ""), course.reviews.total).replacingOccurrences(of: ".", with: "")
        let percentage = getPositiveReviewsUseCase.exec(positive: course.reviews.positive, total: course.reviews.total)
        return "\(percentage)% \(total)"
    }

    var lessons: String {
        return "\(course.lessonsCount) \(NSLocalizedString("lessons", comment: ""))"
    }

    var students: String {
        return "\(course.students) \(NSLocalizedString("students", comment: ""))"
    }

    var audio: String {
        return "\(NSLocalizedString("audio", comment: "")) \(course.audio)"
    }

    var subtitles: String {
        return course.subtitles.isEmpty ? NSLocalizedString("noSubtitles", comment: "") : course.subtitles.joined(separator: ", ")
    }

    var level: (description: String, color: Color) {
        var color: Color = Color.beginnerColor
        switch course.level {
        case .Beginner:
            color = Color.beginnerColor
        case .Intermediate:
            color = Color.intermediateColor
        case .Advanced:
            color = Color.advancedcolor
        }
        return (description: course.level.rawValue.uppercased(), color: color)
    }
}
