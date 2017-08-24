//
//  RedmineTimeEntry+Mapper.swift
//  Importr
//
//  Created by Josef Dolezal on 24/08/2017.
//
//

import Foundation
import Mapper

extension RedmineTimeEntry: Mappable {
    public init(map: Mapper) throws {
        self.ID = try map.from("id")
        self.project = try map.from("project")
        self.issue = try map.from("issue.id")
        self.hours = try map.from("hours")
        self.comment = try map.from("comments")
        self.date = try map.from("spent_on", transformation: Date.standardAPIDateTransformation)
    }
}
