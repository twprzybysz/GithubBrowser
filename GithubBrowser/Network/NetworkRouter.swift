//
//  NetworkRouter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol RouterProtocol {
    var method: HTTPMethod { get }
    var urlPath: URL { get }

    func asURLRequest() -> URLRequest
}

extension RouterProtocol {
    func asURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: urlPath)
        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }
}

enum NetworkRouter: RouterProtocol {
    case fetchUserData(String)
    case fetchRepositoryDataAt(URL)

    var method: HTTPMethod {
        switch self {
        case .fetchUserData, .fetchRepositoryDataAt:
            return .get
        }
    }

    var urlPath: URL {
        switch self {
        case .fetchUserData(let userName):
            return URL.buildUrl(with: userName)!
        case .fetchRepositoryDataAt(let url):
            return url
        }
    }
}
