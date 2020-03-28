//
//  GithubService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol GithubServiceProtocol {
    func getUserData(for userName: String, completionHandler: @escaping (Result<GithubUser, NetworkError>) -> Void)
}

final class GithubService: GithubServiceProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func getUserData(for userName: String, completionHandler: @escaping (Result<GithubUser, NetworkError>) -> Void) {
        networkService.makeRequest(NetworkRouter.fetchUserData(userName)) { result in
            completionHandler(result)
        }
    }

    func getRepositories(with reposUrl: String?, completionHandler: @escaping (Result<[GithubUserRepository], NetworkError>) -> Void) {
        guard let reposUrl = URL(string: reposUrl ?? "") else {
            completionHandler(.failure(NetworkError.invalidUrl))
            return
        }

        networkService.makeRequest(NetworkRouter.fetchRepositoryDataAt(reposUrl)) { result in
            completionHandler(result)
        }
     }
}
