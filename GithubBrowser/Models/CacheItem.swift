//
//  CacheItem.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

struct CacheItem<T: Codable>: Codable {
    let expirationDate: Date
    let item: T

    var isExpired: Bool {
        Date() > expirationDate
    }

    init(secondsToLive: Int, _ item: T) {
        self.item = item
        self.expirationDate = Date().addSeconds(secondsToLive) ?? Date()
    }
}
