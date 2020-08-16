//
//  Utils.swift
//  DomestikaTechTests
//
//  Created by Jmorgaz on 16/08/2020.
//

import Foundation
@testable import DomestikaTech

class TestUtils {
    
    public static func jsonModel<T: Decodable>(withName name: String) -> T? {
        
        let bundle = Bundle(for: self)
        
        if let url = bundle.url(forResource: name, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    static func getBundle() -> Bundle {
        return Bundle(for: self)
    }
}
