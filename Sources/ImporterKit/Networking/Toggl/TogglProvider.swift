//
//  TogglProvider.swift
//  ImporterKit
//
//  Created by Josef Dolezal on 06/08/2017.
//

import Moya
import ReactiveMoya
import ReactiveSwift

typealias TogglProvider = DynamicReactiveProvider<TogglAPI>

enum TogglAPI: APITarget {
    case timeEntries

    var data: (path: String, method: Method, parameters: [String: Any]?) {
        return ("time_entries", .get, nil)
    }

    var path: String { return data.path }

    var method: Moya.Method { return data.method }

    var parameters: [String: Any]? { return data.parameters }
}
