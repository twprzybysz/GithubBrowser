//
//  NetworkError.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
    case error

    var errorDescription: String? {
        switch self {
        case .error: return L10n.errorNetworkError()
        }
    }
}
