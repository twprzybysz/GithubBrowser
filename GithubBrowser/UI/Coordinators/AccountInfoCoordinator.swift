//
//  AccountInfoCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

final class AccountInfoCoordinator: BaseCoordinator {

    private lazy var module = AppEnv.builders.accountInfo.buildModule()

    override func start() {
        navigationController.pushViewController(module, animated: true)
    }
}
