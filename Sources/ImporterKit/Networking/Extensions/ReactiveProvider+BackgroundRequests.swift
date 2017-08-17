//
//  ReactiveProvider+BackgroundRequests.swift
//  Importr
//
//  Created by Josef Dolezal on 17/08/2017.
//
//

import Foundation
import ReactiveSwift
import Moya
import ReactiveMoya

extension ReactiveSwiftMoyaProvider {
    /// Async request with response on given dispatch queue.
    ///
    /// - Parameters:
    ///   - token: Endpoint token
    ///   - dispatchQueue: Queue where the response should be delivered on
    /// - Returns: Producer with server response on success or MoyaError on failure
    public func request(_ token: Target, dispatchQueue: DispatchQueue? = nil) -> SignalProducer<Response, MoyaError> {
        // Creates a producer that starts a request each time it's started.
        return SignalProducer { [weak self] observer, requestDisposable in
            let cancellableToken = self?.request(token, queue: dispatchQueue) { result in
                switch result {
                case let .success(response):
                    observer.send(value: response)
                    observer.sendCompleted()
                case let .failure(error):
                    observer.send(error: error)
                }
            }

            requestDisposable.add {
                // Cancel the request
                cancellableToken?.cancel()
            }
        }
    }
}
