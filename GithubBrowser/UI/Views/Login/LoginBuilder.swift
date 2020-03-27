//
//  LoginBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol LoginBuilderProtocol {
    func buildModule(delegate: LoginPresenterDelegate) -> UIViewController
}

struct LoginBuilder: LoginBuilderProtocol {
    func buildModule(delegate: LoginPresenterDelegate) -> UIViewController {
        let presenter = LoginPresenter(profileService: AppEnv.container.resolve(ProfileService.self)!)
        let view = LoginViewController(presenter: presenter)

        presenter.view = view
        presenter.delegate = delegate

        return view
    }
}
