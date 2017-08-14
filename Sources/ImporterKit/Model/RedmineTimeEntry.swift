//
//  RedmineTimeEntry.swift
//  Importr
//
//  Created by Josef Dolezal on 14/08/2017.
//
//

import Foundation

struct RedmineTimeEntry {
    let ID: Int
    let project: RedmineProject
    let issue: Int
    let hours: Double
    let comment: String
    let date: Date
}
