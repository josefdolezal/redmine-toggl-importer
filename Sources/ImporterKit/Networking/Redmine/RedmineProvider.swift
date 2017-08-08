//
//  RedmineProvider.swift
//  Importr
//
//  Created by Josef Dolezal on 08/08/2017.
//
//

import Moya
import ReactiveMoya

typealias RedmineProvider = DynamicReactiveProvider<RedmineAPI>

enum RedmineAPI: APITarget {
    case timeEntries

    var data: (path: String, method: Method, parameters: [String: Any]?) {
        return ("time_entries.jsom", .get, nil)
    }

    var path: String { return data.path }

    var method: Moya.Method { return data.method }

    var parameters: [String: Any]? { return data.parameters }
}
