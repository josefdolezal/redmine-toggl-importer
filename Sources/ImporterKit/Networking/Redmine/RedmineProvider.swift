//
//  RedmineProvider.swift
//  Importr
//
//  Created by Josef Dolezal on 08/08/2017.
//
//

import Moya
import ReactiveMoya

public typealias RedmineProvider = DynamicReactiveProvider<RedmineAPI>

public enum RedmineAPI: APITarget {
    case timeEntries

    private var data: (path: String, method: Method, parameters: [String: Any]?) {
        return ("time_entries.json", .get, nil)
    }

    public var path: String { return data.path }

    public var method: Moya.Method { return data.method }

    public var parameters: [String: Any]? { return data.parameters }
}
