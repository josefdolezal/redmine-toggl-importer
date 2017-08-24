//
//  RedmineProject.swift
//  Importr
//
//  Created by Josef Dolezal on 14/08/2017.
//
//

import Foundation

public struct RedmineProject: CustomStringConvertible {
    public let ID: Int
    public let name: String

    public var description: String {
        return name
    }
}
