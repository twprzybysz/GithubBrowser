//
//  ProfileError.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

enum ProfileError: LocalizedError {
    case invalidProfile

    var errorDescription: String? {
        switch self {
        case .invalidProfile: return L10n.errorInvalidProfile()
        }
    }
}
