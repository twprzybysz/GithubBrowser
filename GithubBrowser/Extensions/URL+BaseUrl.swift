//
//  URL+BaseUrl.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Keys

extension URL {
    private enum Constants {
        static let baseUrl = "https://api.github.com/users/"
    }

    static func buildUrl(with username: String) -> URL? {
        let keys = GithubBrowserKeys()
        let parameters = [
            "client_id": keys.githubClientId,
            "client_secret": keys.githubClientSecret
        ]
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")

        let urlString = "\(Constants.baseUrl)\(username)?\(parameters)"

        return URL(string: urlString)
    }
}
