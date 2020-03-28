//
//  AccountInfoPresenter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol AccountInfoPresenterDelegate: AnyObject {
    func showProgrammingLanguages(repositoriesStringURL: String)
    func finish()
}

protocol AccountInfoPresenterProtocol: AnyObject {
    func viewDidLoad()
    func languagesDidTap()
    func didTapBack()
}

final class AccountInfoPresenter {
    weak var view: AccountInfoViewProtocol?
    weak var delegate: AccountInfoPresenterDelegate?

    private let githubUser: GithubUser

    init(githubUser: GithubUser) {
        self.githubUser = githubUser
    }
}

extension AccountInfoPresenter: AccountInfoPresenterProtocol {
    func viewDidLoad() {
        view?.configureView(for: githubUser)
    }

    func languagesDidTap() {
        delegate?.showProgrammingLanguages(repositoriesStringURL: githubUser.reposURL ?? "")
    }

    func didTapBack() {
        delegate?.finish()
    }
}
