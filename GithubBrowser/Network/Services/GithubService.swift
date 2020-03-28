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
    func getRepositories(with repositoriesStringUrl: String?, completionHandler: @escaping (Result<[GithubUserRepository], NetworkError>) -> Void)
    func getLanguages(in repositoryStringUrl: String?, completionHandler: @escaping (Result<Languages, NetworkError>) -> Void)
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

    func getRepositories(with repositoriesStringUrl: String?, completionHandler: @escaping (Result<[GithubUserRepository], NetworkError>) -> Void) {
        getData(by: repositoriesStringUrl) { result in
            completionHandler(result)
        }
    }

    func getLanguages(in repositoryStringUrl: String?, completionHandler: @escaping (Result<Languages, NetworkError>) -> Void) {
        getData(by: repositoryStringUrl) { result in
            completionHandler(result)
        }
    }

    private func getData<T: Decodable>(by stringUrl: String?, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: stringUrl ?? "") else {
            completionHandler(.failure(NetworkError.invalidUrl))
            return
        }

        networkService.makeRequest(NetworkRouter.fetchRepositoryDataAt(url)) { result in
            completionHandler(result)
        }
    }
}
