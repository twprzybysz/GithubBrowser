//
//  ProgrammingLanguagesBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol ProgrammingLanguagesBuilderProtocol {
    func buildModule(delegate: ProgrammingLanguagesDelegate) -> UIViewController
}

struct ProgrammingLanguagesBuilder: ProgrammingLanguagesBuilderProtocol {
    func buildModule(delegate: ProgrammingLanguagesDelegate) -> UIViewController {

        let presenter = ProgrammingLanguagesPresenter()
        let view = ProgrammingLanguagesViewController(presenter: presenter)

        presenter.view = view
        presenter.delegate = delegate

        return view
    }
}
