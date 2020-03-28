//
//  ProgrammingLanguagesBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import class UIKit.UIViewController

protocol ProgrammingLanguagesBuilderProtocol {
    func buildModule(repositoriesStringURL: String, delegate: ProgrammingLanguagesDelegate) -> UIViewController
}

struct ProgrammingLanguagesBuilder: ProgrammingLanguagesBuilderProtocol {
    func buildModule(repositoriesStringURL: String, delegate: ProgrammingLanguagesDelegate) -> UIViewController {
        let presenter = ProgrammingLanguagesPresenter(
            programmingLanguagesService: AppEnv.container.resolve(ProgrammingLanguagesServiceProtocol.self)!,
            repositoriesStringURL: repositoriesStringURL
        )
        let view = ProgrammingLanguagesViewController(presenter: presenter)

        presenter.view = view
        presenter.delegate = delegate

        return view
    }
}
