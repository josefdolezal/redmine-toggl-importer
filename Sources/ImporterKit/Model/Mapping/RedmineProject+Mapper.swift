//
//  RedmineProject+Mapper.swift
//  Importr
//
//  Created by Josef Dolezal on 24/08/2017.
//
//

import Mapper

extension RedmineProject: Mappable {
    public init(map: Mapper) throws {
        self.ID = try map.from("id")
        self.name = try map.from("name")
    }
}
