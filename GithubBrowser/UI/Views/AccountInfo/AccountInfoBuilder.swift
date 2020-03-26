//
//  AccountInfoBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol AccountInfoBuilderProtocol {
    func buildModule(githubUser: GithubUser) -> UIViewController
}

struct AccountInfoBuilder: AccountInfoBuilderProtocol {
    func buildModule(githubUser: GithubUser) -> UIViewController {
        let presenter = AccountInfoPresenter(githubUser: githubUser)
        let view = AccountInfoViewController(presenter: presenter)

        presenter.view = view

        return view
    }
}
