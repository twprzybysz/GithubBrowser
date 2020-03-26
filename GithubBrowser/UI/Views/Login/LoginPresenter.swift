//
//  LoginViewPresenter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol LoginPresenterDelegate: AnyObject {
    func showAccountInfo(for githubUser: GithubUser)
}

protocol LoginPresenterProtocol: AnyObject {
    func didChangeUsername(_ userName: String)
    func loginDidTap()
}

final class LoginPresenter {
    weak var view: LoginViewProtocol?
    weak var delegate: LoginPresenterDelegate?

    private var userName = ""
    private var networkProvider: NetworkProviderProtocol

    init(networkProvider: NetworkProviderProtocol) {
        self.networkProvider = networkProvider
    }

    private func fetchData(with username: String) {
        view?.showLoader()
        networkProvider.getUserData(for: username) { [weak self] result in
            defer { self?.view?.dismissLoader() }
            guard let self = self else { return }

            switch result {
            case let .success(githubUser):
                self.delegate?.showAccountInfo(for: githubUser)
            case let .failure(error):
                self.view?.presentError(with: "Error", text: error.localizedDescription)
            }
        }
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    func didChangeUsername(_ userName: String) {
        self.userName = userName
    }

    func loginDidTap() {
        fetchData(with: userName)
    }
}
