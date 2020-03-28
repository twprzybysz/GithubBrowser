//
//  AppEnv+SetupDependencies.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerDependencies() {
        registerServices()
        registerCoordinators()
    }

    private func registerServices() {
        autoregister(GithubServiceProtocol.self, initializer: GithubService.init)
        autoregister(StorageProtocol.self, initializer: UserDefaultsStorage.init)
        autoregister(CacheProtocol.self, initializer: ShortLiveCacheManager.init)
        autoregister(NetworkServiceProtocol.self, initializer: NetworkService.init)
        autoregister(ProfileService.self, initializer: ProfileService.init)
    }

    private func registerCoordinators() {
        autoregister(AppCoordinator.self, argument: UIWindow.self, initializer: AppCoordinator.init)
        autoregister(LoginCoordinator.self, initializer: LoginCoordinator.init)
        autoregister(AccountInfoCoordinator.self, argument: GithubUser.self, initializer: AccountInfoCoordinator.init)
    }
}
