//
//  RedmineService.swift
//  Importr
//
//  Created by Josef Dolezal on 18/08/2017.
//
//

import Moya
import ReactiveSwift

protocol RedmineServiceType {
    func timeEntries() -> SignalProducer<Void, MoyaError>
}

final class RedmineService: RedmineServiceType {

    private let provider: RedmineProvider

    init(provider: RedmineProvider) {
        self.provider = provider
    }

    func timeEntries() -> SignalProducer<Void, MoyaError> {
        return provider.request(.timeEntries)
            .filterSuccessfulStatusCodes()
            .map { _ in }
    }
}
