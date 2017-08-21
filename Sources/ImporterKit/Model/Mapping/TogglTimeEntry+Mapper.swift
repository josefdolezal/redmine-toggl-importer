//
//  TogglTimeEntry+Mapper.swift
//  Importr
//
//  Created by Josef Dolezal on 19/08/2017.
//
//

import Foundation
import Mapper

extension TogglTimeEntry: Mappable {
    public init(map: Mapper) throws {
        let ID: Int = try map.from("id")
        let description: String = try map.from("description")
        let start: Date = try map.from("start")
        let end: Date = try map.from("end")
        let duration: Int = try map.from("duration")
        let client: String = try map.from("client")
        let project: String = try map.from("project")
        let tags: [String] = try map.from("tags")

        self.init(ID: ID, description: description, start: start, end: end, duration: duration,
                  client: client, project: project, tags: tags)
    }
}
