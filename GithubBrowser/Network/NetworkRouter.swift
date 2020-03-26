//
//  NetworkRouter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Alamofire

enum NetworkRouter: URLRequestConvertible {
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

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: urlPath)
        urlRequest.httpMethod = method.rawValue

        switch self {
        case .fetchUserData, .fetchRepositoryDataAt:
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: nil)
        }
    }
}
