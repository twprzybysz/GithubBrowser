//
//  AccountInfoPresenter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol AccountInfoPresenterDelegate: AnyObject { }

protocol AccountInfoPresenterProtocol: AnyObject {
    func viewDidLoad()
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
}
