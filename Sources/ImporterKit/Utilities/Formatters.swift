//
//  Formatters.swift
//  Importr
//
//  Created by Josef Dolezal on 21/08/2017.
//
//

import Foundation

enum Formatters {
    static let ISODateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()

        formatter.formatOptions = [.withInternetDateTime]

        return formatter
    }()

    static let DisplayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()

        formatter.dateFormat = "dd. MM. YYYY"

        return formatter
    }()

    static let StandardAPIDateFormatter: DateFormatter = {
        let formatter = DateFormatter()

        formatter.dateFormat = "YYYY-MM-dd"

        return formatter
    }()

    static let TimeFormatter: (Double) -> String = { time in
        let hours = Int(time)
        let minutes = Int(modf(time).1 * 60)

        return String.init(format: "%2d:%2d", hours, minutes)
    }
}
