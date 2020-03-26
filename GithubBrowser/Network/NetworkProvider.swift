//
//  NetworkProvider.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Alamofire

protocol NetworkProviderProtocol {
    func getUserData(for userName: String, completionHandler: @escaping (Result<GithubUser, NetworkError>) -> Void)
}

final class NetworkProvider: NetworkProviderProtocol {
    private enum Constants {
        static let networkTimeout: TimeInterval = 30.0
    }

    let alamofireSession: Session

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = Constants.networkTimeout
        configuration.timeoutIntervalForRequest = Constants.networkTimeout

        alamofireSession = Session(configuration: configuration)
    }

    func getUserData(for userName: String, completionHandler: @escaping (Result<GithubUser, NetworkError>) -> Void) {
        alamofireSession.request(NetworkRouter.fetchUserData(userName))
            .responseData { responseData in
                guard let data = responseData.data,
                    let response = try? JSONDecoder.withIso8601DateDecoder.decode(GithubUser.self, from: data) else {
                    completionHandler(.failure(NetworkError.error))
                    return
                }

                completionHandler(.success(response))
            }
    }
}
