//
//  UserDefaultsStorage.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol StorageProtocol {
    func load<T: Decodable>(for key: String) -> T?
    func save<T: Encodable>(for key: String, _ object: T)
}

final class UserDefaultsStorage: StorageProtocol {
    private let storage = UserDefaults.standard

    func load<T: Decodable>(for key: String) -> T? {
        guard let data = storage.data(forKey: key) else { return nil }

        return try? JSONDecoder().decode(T.self, from: data)
    }

    func save<T: Encodable>(for key: String, _ object: T) {
        guard let data = try? JSONEncoder().encode(object) else { return }

        storage.set(data, forKey: key)
    }
}
