//
//  ProfileService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol ProfileServiceDelegate: AnyObject {
    func profileDidLoad(_ githubUser: GithubUser)
    func profileDidLoadWithError(_ error: Error)
}

protocol ProfileServiceProtocol {
    var delegate: ProfileServiceDelegate? { get set }
    
    func getProfile(for username: String)
}

final class ProfileService: ProfileServiceProtocol {
    private enum Constants {
        static let maximumSecondsToLive = 60
    }

    weak var delegate: ProfileServiceDelegate?

    private let networkProvider: NetworkProviderProtocol
    private let cacheManager: CacheProtocol

    init(
        networkProvider: NetworkProviderProtocol,
        cacheManager: CacheProtocol
    ) {
        self.networkProvider = networkProvider
        self.cacheManager = cacheManager
    }

    func getProfile(for username: String) {
        let profileKey = buildKey(using: username)
        if let githubUser: GithubUser = cacheManager.loadFromCache(for: profileKey) {
            delegate?.profileDidLoad(githubUser)
            print("⚠️ Loaded from cache")
            return
        }

        print("⚠️ Loading from network")

        networkProvider.getUserData(for: username) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(githubUser):
                guard githubUser.isValid else {
                    self.delegate?.profileDidLoadWithError(ProfileError.invalidProfile)
                    return
                }

                self.cacheManager.saveToCache(
                    key: profileKey,
                    secondsToLive: Constants.maximumSecondsToLive,
                    githubUser
                )
                
                self.delegate?.profileDidLoad(githubUser)
            case let .failure(error):
                self.delegate?.profileDidLoadWithError(error)
            }
        }
    }

    private func buildKey(using username: String) -> String {
        return "github-\(username)"
    }
}
