//
//  DynamicProvider.swift
//  Importr
//
//  Created by Josef Dolezal on 08/08/2017.
//
//

import Foundation
import Moya
import ReactiveMoya
import ReactiveSwift

public protocol APITargetType {
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Moya.Method { get }

    /// Provides stub data for use in testing.
    var sampleData: Data { get }

    /// The type of HTTP task to be performed.
    var task: Task { get }

    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool { get }

    // The headers to be used in the request.
    var headers: [String: String]? { get }
}

public extension APITargetType {
    public var sampleData: Data { return Data() }

    public var validate: Bool { return false }

    public var headers: [String: String]? { return nil }
}

public struct DynamicTarget: TargetType {
    public var baseURL: URL

    public var apiTarget: APITargetType

    public var path: String { return apiTarget.path }

    public var method: Moya.Method { return apiTarget.method }

    public var sampleData: Data { return apiTarget.sampleData }

    public var task: Task { return apiTarget.task }

    public var validate: Bool { return apiTarget.validate }

    public var headers: [String : String]? { return apiTarget.headers }
}

public final class DynamicProvider<APITarget>: MoyaProvider<DynamicTarget> where APITarget: APITargetType {
    private let baseURL: URL
    private let backgroundQueue = DispatchQueue(label: "ImportrKit", qos: DispatchQoS.background)

    public init(baseURL: URL, endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                callbackQueue: DispatchQueue? = nil,
                manager: Manager = MoyaProvider<DynamicTarget>.defaultAlamofireManager(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {

        self.baseURL = baseURL

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure,
                   callbackQueue: callbackQueue, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }

    public func request(_ apiTarget: APITarget) -> SignalProducer<Response, MoyaError> {
        let dynamicTarget = DynamicTarget(baseURL: baseURL, apiTarget: apiTarget)

        return reactive.request(dynamicTarget, callbackQueue: backgroundQueue)
    }

    public func requestWithProgress(_ apiTarget: APITarget) -> SignalProducer<ProgressResponse, MoyaError> {
        let dynamicTarget = DynamicTarget.init(baseURL: baseURL, apiTarget: apiTarget)

        return reactive.requestWithProgress(dynamicTarget, callbackQueue: backgroundQueue)
    }
}
