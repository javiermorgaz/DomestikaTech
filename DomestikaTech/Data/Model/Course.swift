//
//  Course.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation

enum Level: String, Decodable {
    case Beginner
    case Intermediate
    case Advanced
}

struct Course: Decodable, Hashable {
    let courseId: String
    let thumbnail: String
    let title: String
    let trailer: String
    let description: String
    let location: String
    let teacher: Teacher
    let reviews: Reviews
    let lessonsCount: Int
    let students: Int
    let audio: String
    let subtitles: [String]
    let level: Level
    
    enum CodingKeys: String, CodingKey {
        case courseId = "id"
        case thumbnail = "thumbnailUrl"
        case title
        case trailer = "trailerUrl"
        case description
        case location
        case teacher
        case reviews
        case lessonsCount
        case students
        case audio
        case subtitles
        case level
    }

    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.courseId == rhs.courseId
    }
}

struct Teacher: Decodable, Hashable {
    let name: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatar = "avatarUrl"
    }
}

struct Reviews: Decodable, Hashable {
    let positive: Int
    let total: Int
}
