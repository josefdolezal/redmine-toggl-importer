//
//  TogglService.swift
//  Importr
//
//  Created by Josef Dolezal on 18/08/2017.
//
//

import Moya
import ReactiveSwift

protocol TogglServiceType {
    func timeEntries() -> SignalProducer<Void, MoyaError>
}

final class TogglService: TogglServiceType {
    private let provider: TogglProvider

    init(provider: TogglProvider) {
        self.provider = provider
    }

    func timeEntries() -> SignalProducer<Void, MoyaError> {
        return provider.request(.timeEntries)
            .filterSuccessfulStatusCodes()
            .map { _ in }
    }
}
