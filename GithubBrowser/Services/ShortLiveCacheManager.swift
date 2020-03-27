//
//  ShortLiveCacheManager.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol CacheProtocol {
    func loadFromCache<T: Codable>(for key: String) -> T?
    func saveToCache<T: Codable>(key: String, secondsToLive: Int, _ object: T)
}

final class ShortLiveCacheManager: CacheProtocol {
    private let storage: StorageProtocol

    init(storage: StorageProtocol) {
        self.storage = storage
    }

    func loadFromCache<T: Codable>(for key: String) -> T? {
        guard let cachedItem: CacheItem<T> = storage.load(for: key),
            !cachedItem.isExpired else { return nil }

        return cachedItem.item
    }

    func saveToCache<T: Codable>(key: String, secondsToLive: Int, _ object: T) {
        storage.save(for: key, CacheItem(secondsToLive: secondsToLive, object))
    }
}
