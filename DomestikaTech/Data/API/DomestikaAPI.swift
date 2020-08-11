//
//  DomestikaAPI.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 11/08/2020.
//

import Foundation

enum DomestikaAPIRouter {
    
    case courses
    
    struct ResourceKeys {
        static let challenge = "/challenge"
    }
    
    var method: String {
        
        switch self {
        case .courses: return "GET"
        }
    }
    
    var path: String {
        
        switch self {
        case .courses: return "\(ResourceKeys.challenge)/home.json"
        }
    }
    
    var quertItems: [URLQueryItem] {
        switch self {
        case .courses: return []
        }
    }
}

