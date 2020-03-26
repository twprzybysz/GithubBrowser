//
//  AccountInfoCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

final class AccountInfoCoordinator: BaseCoordinator {

    private lazy var module = AppEnv.builders.accountInfo.buildModule(githubUser: githubUser)
    private let githubUser: GithubUser

    init(githubUser: GithubUser) {
        self.githubUser = githubUser
    }

    override func start() {
        navigationController.pushViewController(module, animated: true)
    }
}
