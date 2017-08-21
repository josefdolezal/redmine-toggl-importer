//
//  TogglService.swift
//  Importr
//
//  Created by Josef Dolezal on 18/08/2017.
//
//

import Moya
import ReactiveSwift
import ReactiveMoya_ModelMapper

public protocol TogglServiceType {
    func timeEntries() -> SignalProducer<[TogglTimeEntry], MoyaError>
}

public final class TogglService: TogglServiceType {
    private let provider: TogglProvider

    public init(provider: TogglProvider) {
        self.provider = provider
    }

    public func timeEntries() -> SignalProducer<[TogglTimeEntry], MoyaError> {
        return provider.request(.timeEntries)
            .filterSuccessfulStatusCodes()
            .mapArray(type: TogglTimeEntry.self)
    }
}
