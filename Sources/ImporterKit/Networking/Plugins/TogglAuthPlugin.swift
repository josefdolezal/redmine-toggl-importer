//
//  TogglAuthPlugin.swift
//  Importr
//
//  Created by Josef Dolezal on 10/08/2017.
//
//

import Foundation
import Moya

final class TogglAuthPlugin: PluginType {
    private let token: String

    private struct HeaderKeys {
        static let authorization = "Basic"
    }

    init(token: String) {
        self.token = token
    }

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutableRequst = request

        mutableRequst.addValue(token, forHTTPHeaderField: "\(HeaderKeys.authorization) \(token)")

        return mutableRequst
    }
}
