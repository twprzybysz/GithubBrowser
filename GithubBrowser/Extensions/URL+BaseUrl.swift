//
//  URL+BaseUrl.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

extension URL {
    private enum Constants {
        static let baseUrl = "https://api.github.com/users/"
        
    }

    static func buildUrl(with username: String) -> URL? {
        let parameters = [
            "client_id": Constants.clientId,
            "client_secret": Constants.clientSecret
            ]
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")

        let urlString = "\(Constants.baseUrl)\(username)?\(parameters)"

        return try? urlString.asURL()
    }
}
