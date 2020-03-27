//
//  GithubUserRepository.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

struct GithubUserRepository: Decodable {
    enum CodingKeys: String, CodingKey {
        case languagesUrl = "languages_url"
        case isFork = "fork"
    }

    let languagesUrl: String
    let isFork: Bool
}
