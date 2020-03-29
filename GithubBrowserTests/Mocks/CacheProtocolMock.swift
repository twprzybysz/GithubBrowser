//
//  CacheProtocolMock.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 29/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser

final class CacheProtocolMock: CacheProtocol {

    var loadFromCacheCallsCount = 0
    var loadFromCacheCalled: Bool {
        return loadFromCacheCallsCount > 0
    }

    var loadFromCacheReceivedObject: Any?

    func loadFromCache<T: Codable>(for key: String) -> T? {
        loadFromCacheCallsCount += 1
        return loadFromCacheReceivedObject as? T
    }

    var saveToCacheCallsCount = 0
    var saveToCacheCalled: Bool {
        return loadFromCacheCallsCount > 0
    }

    func saveToCache<T: Codable>(key: String, secondsToLive: Int, _ object: T) {
        saveToCacheCallsCount += 1
    }
}
