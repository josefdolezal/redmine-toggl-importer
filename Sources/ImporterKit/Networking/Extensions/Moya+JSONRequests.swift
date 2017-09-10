//
//  Moya+JSONRequests.swift
//  ImporterKit
//
//  Created by Josef Dolezal on 10/09/2017.
//

import Moya

extension Task {
    static func jsonRequest(_ parameters: [String: Any]) -> Task {
        return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    }
}
