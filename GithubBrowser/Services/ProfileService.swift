//
//  ProfileService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol ProfileServiceDelegate: AnyObject, AutoMockable {
    func profileDidLoad(_ githubUser: GithubUser)
    func profileDidLoadWithError(_ error: Error)
}

protocol ProfileServiceProtocol: AutoMockable {
    var delegate: ProfileServiceDelegate? { get set }
    
    func getProfile(for username: String)
}

final class ProfileService: ProfileServiceProtocol {
    private enum Constants {
        static let maximumSecondsToLive = 60
    }

    weak var delegate: ProfileServiceDelegate?

    private let githubService: GithubServiceProtocol
    private let cacheManager: CacheProtocol

    init(
        githubService: GithubServiceProtocol,
        cacheManager: CacheProtocol
    ) {
        self.githubService = githubService
        self.cacheManager = cacheManager
    }

    func getProfile(for username: String) {
        let profileKey = ProfileKey(username: username)
        if let githubUser: GithubUser = cacheManager.loadFromCache(for: profileKey.value) {
            delegate?.profileDidLoad(githubUser)
            print("⚠️ Loaded from cache")
            return
        }

        print("⚠️ Loading from network")
        fetchUserData(for: username, profileKey: profileKey)
    }

    private func fetchUserData(for username: String, profileKey: ProfileKeyProtocol) {
        githubService.getUserData(for: username) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(githubUser):
                guard githubUser.isValid else {
                    self.delegate?.profileDidLoadWithError(ProfileError.invalidProfile)
                    return
                }

                self.cacheManager.saveToCache(
                    key: profileKey.value,
                    secondsToLive: Constants.maximumSecondsToLive,
                    githubUser
                )

                self.delegate?.profileDidLoad(githubUser)
            case let .failure(error):
                self.delegate?.profileDidLoadWithError(error)
            }
        }
    }
}
