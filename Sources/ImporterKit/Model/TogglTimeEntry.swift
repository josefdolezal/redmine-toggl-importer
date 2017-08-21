//
//  TogglTimeEntry.swift
//  Importr
//
//  Created by Josef Dolezal on 13/08/2017.
//
//

import Foundation

public struct TogglTimeEntry {
    public let ID: Int
    public let description: String?
    public let start: Date
    public let end: Date
    public let duration: Int
    public let client: String
    public let project: String
    public let tags: [String]
}
