//
//  RedmineTimeEntry.swift
//  Importr
//
//  Created by Josef Dolezal on 14/08/2017.
//
//

import Foundation

public struct RedmineTimeEntry: CustomStringConvertible {
    public let ID: Int
    public let project: RedmineProject
    public let issue: Int
    public let hours: Double
    public let comment: String
    public let date: Date

    public var description: String {
        return "[\(Formatters.DisplayDateFormatter.string(from: date))] \(comment), \(project)"
    }
}
