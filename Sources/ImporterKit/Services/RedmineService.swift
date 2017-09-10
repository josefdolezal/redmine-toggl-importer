//
//  RedmineService.swift
//  Importr
//
//  Created by Josef Dolezal on 18/08/2017.
//
//

import Moya
import ReactiveSwift

public protocol RedmineServiceType {
    func timeEntries(limit: Int, offset: Int) -> SignalProducer<[RedmineTimeEntry], MoyaError>
}

public final class RedmineService: RedmineServiceType {

    private let provider: RedmineProvider
    private let userID: Int = 284

    public init(provider: RedmineProvider) {
        self.provider = provider
    }

    public func timeEntries(limit: Int, offset: Int = 0) -> SignalProducer<[RedmineTimeEntry], MoyaError> {
        return provider.request(.timeEntries(userID: userID, limit: limit, offset: offset))
            .filterSuccessfulStatusCodes()
            .map(to: [RedmineTimeEntry].self, keyPath: "time_entries")
    }
}
