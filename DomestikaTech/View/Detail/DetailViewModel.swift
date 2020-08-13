//
//  DetailViewModel.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 13/08/2020.
//

import Foundation

struct DetailViewModel {
    
    private let course: Course
    
    init(course: Course) {
        self.course = course
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
        return course.reviews.positive.description
    }
    
    var lessons: String {
        return course.lessonsCount.description
    }
    
    var students: String {
        return course.students.description
    }
    
    var audio: String {
        return course.audio
    }
    
    var subtitles: String {
        return course.subtitles.isEmpty ? "No subtitles available" : course.subtitles.joined(separator: ", ")
    }
    
    var level: String {
        return course.level
    }
}
