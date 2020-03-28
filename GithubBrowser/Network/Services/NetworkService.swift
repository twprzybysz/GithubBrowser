//
//  NetworkService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Alamofire

protocol NetworkServiceProtocol {
    func makeRequest<T: Decodable>(
        _ router: NetworkRouter,
        completionHandler: @escaping (Result<T, NetworkError>) -> Void
    )
}

final class NetworkService: NetworkServiceProtocol {
    private enum Constants {
        static let networkTimeout: TimeInterval = 30.0
    }

    private let alamofireSession: Session
    private let decoder = JSONDecoder.withIso8601DateDecoder

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = Constants.networkTimeout
        configuration.timeoutIntervalForRequest = Constants.networkTimeout

        alamofireSession = Session(configuration: configuration)
    }

    func makeRequest<T: Decodable>(_ router: NetworkRouter, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        alamofireSession.request(router)
            .responseData { [weak self] responseData in
                #warning("TODO: handle other type of errors")
                guard let data = responseData.data,
                    let response = try? self?.decoder.decode(T.self, from: data) else {
                    completionHandler(.failure(NetworkError.error))
                    return
                }

                completionHandler(.success(response))
            }
    }
}
