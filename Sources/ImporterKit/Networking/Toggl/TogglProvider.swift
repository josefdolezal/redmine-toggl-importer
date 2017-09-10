//
//  TogglProvider.swift
//  ImporterKit
//
//  Created by Josef Dolezal on 06/08/2017.
//

import Moya
import ReactiveMoya
import ReactiveSwift

public typealias TogglProvider = DynamicProvider<TogglAPI>

public enum TogglAPI: APITargetType {
    case validateAccessToken
    case timeEntries

    private var data: (path: String, method: Method, task: Task) {
        switch self {
        case .validateAccessToken:
            return("me", .get, .requestPlain)
        case .timeEntries:
            return ("time_entries", .get, .requestPlain)
        }
    }

    public var path: String { return data.path }

    public var method: Moya.Method { return data.method }

    public var task: Task { return data.task }
}
