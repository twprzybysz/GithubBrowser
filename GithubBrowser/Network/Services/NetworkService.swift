//
//  NetworkService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

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

    private var session: URLSession

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = Constants.networkTimeout
        configuration.timeoutIntervalForRequest = Constants.networkTimeout

        session = URLSession(configuration: configuration)
    }

    func makeRequest<T: Decodable>(_ router: NetworkRouter, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        let task = session.dataTask(with: router.asURLRequest()) { data, response, error in
            #warning("TODO: handle other type of errors")
            guard error == nil,
                let data = data,
                let response = try? JSONDecoder.withIso8601DateDecoder.decode(T.self, from: data) else {
                completionHandler(.failure(NetworkError.error))
                return
            }

            completionHandler(.success(response))
        }

        task.resume()
    }
}
