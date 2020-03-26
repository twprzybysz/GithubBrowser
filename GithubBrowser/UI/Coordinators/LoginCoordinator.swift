//
//  LoginCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

final class LoginCoordinator: BaseCoordinator {

    private lazy var module = AppEnv.builders.login.buildModule(delegate: self)

    override func start() {
        navigationController.pushViewController(module, animated: true)
    }
}

extension LoginCoordinator: LoginPresenterDelegate {
    func showAccountInfo(for githubUser: GithubUser) {
        let accountInfo = AppEnv.container.resolve(AccountInfoCoordinator.self, argument: githubUser)!
        accountInfo.navigationController = navigationController
        start(coordinator: accountInfo)
    }
}
