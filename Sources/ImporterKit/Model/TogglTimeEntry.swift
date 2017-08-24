//
//  TogglTimeEntry.swift
//  Importr
//
//  Created by Josef Dolezal on 13/08/2017.
//
//

import Foundation

public struct TogglTimeEntry: CustomStringConvertible {
    public let ID: Int
    public let comment: String
    public let start: Date
    public let end: Date
    public let duration: Int
    public let tags: [String]

    public var description: String {
        return "[\(Formatters.DisplayDateFormatter.string(from: start))] \(comment)"
    }
}
