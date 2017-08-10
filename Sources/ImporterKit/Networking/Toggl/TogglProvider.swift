//
//  TogglProvider.swift
//  ImporterKit
//
//  Created by Josef Dolezal on 06/08/2017.
//

import Moya
import ReactiveMoya
import ReactiveSwift

public typealias TogglProvider = DynamicReactiveProvider<TogglAPI>

public enum TogglAPI: APITarget {
    case timeEntries

    private var data: (path: String, method: Method, parameters: [String: Any]?) {
        return ("time_entries", .get, nil)
    }

    public var path: String { return data.path }

    public var method: Moya.Method { return data.method }

    public var parameters: [String: Any]? { return data.parameters }
}
