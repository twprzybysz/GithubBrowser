//
//  ProfileKey.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol ProfileKeyProtocol {
    var value: String { get }
}

struct ProfileKey {
    let username: String
}

extension ProfileKey: ProfileKeyProtocol {
    var value: String {
        "github-\(username)"
    }
}
