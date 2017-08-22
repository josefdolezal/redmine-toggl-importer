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
}
