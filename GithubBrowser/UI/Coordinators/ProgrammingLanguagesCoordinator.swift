//
//  ProgrammingLanguagesCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

final class ProgrammingLanguagesCoordinator: BaseCoordinator {

    private lazy var module = AppEnv.builders.programmingLanguages.buildModule(
        repositoriesStringURL: repositoriesStringURL, delegate: self
    )

    private let repositoriesStringURL: String

    init(repositoriesStringURL: String) {
        self.repositoriesStringURL = repositoriesStringURL
    }

    override func start() {
        navigationController.present(module, animated: true)
        module.presentationController?.delegate = self
    }

    override func finish() {
        module.dismiss(animated: true)

        super.finish()
    }
}

extension ProgrammingLanguagesCoordinator: ProgrammingLanguagesDelegate { }

extension ProgrammingLanguagesCoordinator: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        finish()
    }
}
