//
//  AccountInfoBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol AccountInfoBuilderProtocol {
    func buildModule(githubUser: GithubUser, delegate: AccountInfoPresenterDelegate) -> UIViewController
}

struct AccountInfoBuilder: AccountInfoBuilderProtocol {
    func buildModule(githubUser: GithubUser, delegate: AccountInfoPresenterDelegate) -> UIViewController {
        let presenter = AccountInfoPresenter(githubUser: githubUser)
        let view = AccountInfoViewController(presenter: presenter)

        presenter.view = view
        presenter.delegate = delegate

        return view
    }
}
