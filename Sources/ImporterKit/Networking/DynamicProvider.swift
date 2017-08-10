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

public protocol APITarget {
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Moya.Method { get }

    /// The parameters to be encoded in the request.
    var parameters: [String: Any]? { get }

    /// The method used for parameter encoding.
    var parameterEncoding: ParameterEncoding { get }

    /// Provides stub data for use in testing.
    var sampleData: Data { get }

    /// The type of HTTP task to be performed.
    var task: Task { get }

    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool { get }
}

public extension APITarget {
    public var parameterEncoding: ParameterEncoding { return JSONEncoding.default }

    public var sampleData: Data { return Data() }

    public var task: Task { return .request }

    public var validate: Bool { return false }
}

public struct DynamicTarget: TargetType {
    public var baseURL: URL

    public var apiTarget: APITarget

    public var path: String { return apiTarget.path }

    public var method: Moya.Method { return apiTarget.method }

    public var parameters: [String: Any]? { return apiTarget.parameters }

    public var parameterEncoding: ParameterEncoding { return apiTarget.parameterEncoding }

    public var sampleData: Data { return apiTarget.sampleData }

    public var task: Task { return apiTarget.task }

    public var validate: Bool { return apiTarget.validate }
}

public final class DynamicReactiveProvider<Target>: ReactiveSwiftMoyaProvider<DynamicTarget> where Target: APITarget {
    private let baseURL: URL

    public init(baseURL: URL,
         endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
         requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
         manager: Manager = ReactiveSwiftMoyaProvider<DynamicTarget>.defaultAlamofireManager(),
         plugins: [PluginType] = [], stubScheduler: DateScheduler? = nil,
         trackInflights: Bool = false) {

        self.baseURL = baseURL

        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure,
                   manager: manager, plugins: plugins, stubScheduler: stubScheduler, trackInflights: trackInflights)
    }

    public func request(_ token: Target) -> SignalProducer<Response, MoyaError> {
        let dynamicTarget = DynamicTarget(baseURL: baseURL, apiTarget: token)
        return super.request(dynamicTarget)
    }

    public func requestWithProgress(token: Target) -> SignalProducer<ProgressResponse, MoyaError> {
        let dynamicTarget = DynamicTarget(baseURL: baseURL, apiTarget: token)

        return super.requestWithProgress(token: dynamicTarget)
    }
}
