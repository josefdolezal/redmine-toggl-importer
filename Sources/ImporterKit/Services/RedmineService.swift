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
    func timeEntries() -> SignalProducer<[RedmineTimeEntry], MoyaError>
}

public final class RedmineService: RedmineServiceType {

    private let provider: RedmineProvider

    public init(provider: RedmineProvider) {
        self.provider = provider
    }

    public func timeEntries() -> SignalProducer<[RedmineTimeEntry], MoyaError> {
        return provider.request(.timeEntries)
            .filterSuccessfulStatusCodes()
            .mapArray(type: RedmineTimeEntry.self, keyPath: "time_entries")
    }
}
