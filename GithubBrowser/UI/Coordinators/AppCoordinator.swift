//
//  AppCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

    private var window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let loginCoordinator = AppEnv.container.resolve(LoginCoordinator.self)!
        loginCoordinator.navigationController = navigationController

        start(coordinator: loginCoordinator)
    }
}
