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
    case timeEntries(userID: Int, limit: Int, offset: Int)

    private var data: (path: String, method: Method, parameters: [String: Any]?) {
        switch self {
        case let .timeEntries(userID, limit, offset):
            return ("time_entries.json", .get, ["user_id": userID, "limit": limit, "offset": offset])
        }
    }

    public var parameterEncoding: ParameterEncoding {
        switch data.method {
        case .put, .post: return JSONEncoding.default
        default: return URLEncoding.default
        }
    }

    public var path: String { return data.path }

    public var method: Moya.Method { return data.method }

    public var parameters: [String: Any]? { return data.parameters }
}
