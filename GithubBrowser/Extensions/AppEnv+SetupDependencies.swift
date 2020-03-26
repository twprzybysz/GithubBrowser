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
        autoregister(NetworkProvider.self, initializer: NetworkProvider.init)
    }

    private func registerCoordinators() {
        register(UIWindow.self) { _ in UIApplication.shared.delegate!.window!! }
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(LoginCoordinator.self, initializer: LoginCoordinator.init)
        autoregister(AccountInfoCoordinator.self, initializer: AccountInfoCoordinator.init)
    }
}
