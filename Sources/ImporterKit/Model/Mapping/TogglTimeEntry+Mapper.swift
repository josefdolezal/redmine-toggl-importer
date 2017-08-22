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
        let end: Date = try map.from("stop")
        let duration: Int = try map.from("duration")
        let tags: [String] = map.optionalFrom("tags") ?? []

        self.init(ID: ID, description: description, start: start, end: end,
                  duration: duration, tags: tags)
    }
}
