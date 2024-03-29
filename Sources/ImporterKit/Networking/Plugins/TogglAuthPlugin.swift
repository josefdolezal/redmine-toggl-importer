//
//  TogglAuthPlugin.swift
//  Importr
//
//  Created by Josef Dolezal on 10/08/2017.
//
//

import Foundation
import Moya

public final class TogglAuthPlugin: PluginType {
    private let token: String

    private struct HeaderKeys {
        static let authorization = "Authorization"

        static func basicAuthorization(_ token: String) -> String {
            return "Basic \(token)"
        }
    }

    public init(token: String) {
        self.token = token
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutableRequst = request

        mutableRequst.addValue(HeaderKeys.basicAuthorization(token), forHTTPHeaderField: HeaderKeys.authorization)

        return mutableRequst
    }
}
