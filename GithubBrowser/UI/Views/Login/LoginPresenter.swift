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
    private var profileService: ProfileServiceProtocol

    init(profileService: ProfileServiceProtocol) {
        self.profileService = profileService
        self.profileService.delegate = self
    }

    private func fetchData(with username: String) {
        guard !userName.isEmpty else {
            view?.highlightFieldWithError(text: "Field is empty")
            return
        }

        view?.showLoader()
        profileService.getProfile(for: username)
    }

    private func clearUserName() {
        userName = ""
        view?.clearTextField()
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

extension LoginPresenter: ProfileServiceDelegate {
    func profileDidLoad(_ githubUser: GithubUser) {
        view?.dismissLoader()
        clearUserName()

        delegate?.showAccountInfo(for: githubUser)
    }

    func profileDidLoadWithError(_ error: Error) {
        view?.dismissLoader()
        
        view?.presentError(with: "Error", text: error.localizedDescription)
    }
}
