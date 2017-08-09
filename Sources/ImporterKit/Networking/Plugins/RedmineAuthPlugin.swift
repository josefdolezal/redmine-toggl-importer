//
//  RedmineAuthPlugin.swift
//  Importr
//
//  Created by Josef Dolezal on 09/08/2017.
//
//

import Foundation
import Moya

final class RedmineAuthPlugin: PluginType {
    private let token: String

    private struct HeaderKeys {
        static let authorization = "X-Redmine-API-Key"
    }

    init(token: String) {
        self.token = token
    }

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutableRequest = request

        mutableRequest.setValue(token, forHTTPHeaderField: HeaderKeys.authorization)

        return mutableRequest
    }
}
