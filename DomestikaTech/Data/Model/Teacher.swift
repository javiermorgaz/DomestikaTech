//
//  Teacher.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 16/08/2020.
//

import Foundation

struct Teacher: Decodable, Hashable {
    let name: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case name
        case avatar = "avatarUrl"
    }
}
