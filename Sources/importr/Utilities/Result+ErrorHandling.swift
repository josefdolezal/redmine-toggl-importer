//
//  Result+ErrorHandling.swift
//  importr
//
//  Created by Josef Dolezal on 10/09/2017.
//

import Result
import Moya

struct NoResponseError: Error {
    var localizedDescription: String { return "" }
}

extension Result where Error == MoyaError {
    /// Requires request to be successfull.
    ///
    /// - Returns: Value when request was successfull.
    /// - Throws: MoyaError on failure.
    func failOnError() throws -> T {
        switch self {
        case let .success(value): return value
        case let .failure(error): throw error
        }
    }
}

protocol OptionalResultType {
    associatedtype Value
    associatedtype ResultError: Error

    var result: Result<Value, ResultError> { get }
}

extension Result: OptionalResultType {
    typealias Value = T
    typealias ResultError = Result.Error

    var result: Result<T, Error> {
        return self
    }
}

extension Optional where Wrapped: OptionalResultType, Wrapped.ResultError == MoyaError {
    /// Requires request to be non-nil and successfull. Comes together with rective API for
    /// synchronous calls, which may return {nil | success | error}.
    ///
    /// - Returns: Value if response is non-nil and successfull.
    /// - Throws: MoyaError on failure, NoResponseError on `nil`.
    func requireSuccess() throws -> Wrapped.Value {
        switch self {
        case let .some(response): return try response.result.failOnError()
        case .none: throw NoResponseError()
        }
    }
}
