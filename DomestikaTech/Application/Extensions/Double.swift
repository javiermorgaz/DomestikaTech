//
//  Double.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 14/08/2020.
//

import Foundation

extension Double {
    var toTime: String {

        let value = Int(self)
        let hours: Int = Int(value / 3600)
        let minutes: Int = Int(value % 3600 / 60)
        let seconds: Int = Int((value % 3600) % 60)

        return hours > 0 ? String(format: "%i:%02i:%02i", hours, minutes, seconds) : String(format: "%02i:%02i", minutes, seconds)
    }
}
