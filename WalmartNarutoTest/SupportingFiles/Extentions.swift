//
//  Extentions.swift
//  WalmartNarutoTest
//
//  Created by Igor Chernobai on 7/27/21.
//

import Foundation


extension String {
    /// Formatting ISODate string to human readable format
    /// - Returns: Formatted string with "dateFormat" format
    func getDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd"
            let day = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "MM"
            let month = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "yyyy"
            let year = dateFormatter.string(from: date)

            return "\(month)/\(day)/\(year)"
        }
        return "-"
    }
}
