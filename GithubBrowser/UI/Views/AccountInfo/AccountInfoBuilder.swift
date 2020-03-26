//
//  AccountInfoBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol AccountInfoBuilderProtocol {
    func buildModule() -> UIViewController
}

struct AccountInfoBuilder: AccountInfoBuilderProtocol {
    func buildModule() -> UIViewController {
        let presenter = AccountInfoPresenter()
        let view = AccountInfoViewController(presenter: presenter)

        presenter.view = view

        return view
    }
}
