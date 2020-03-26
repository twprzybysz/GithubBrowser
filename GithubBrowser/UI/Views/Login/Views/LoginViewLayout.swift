//
//  LoginViewLayout.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class LoginViewLayout {
    let view: UIView
    let loginTextField = UITextField()
    let loginButton = UIButton(type: .system)

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        view.setupBackground()
        setupLoginTextField()
        setupLoginButton()
    }

    private func setupLoginTextField() {
        view.addSubview(loginTextField)

        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.cornerRadius = 4.0
        loginTextField.clipsToBounds = true
        loginTextField.font = .systemFont(ofSize: 20)
        loginTextField.autocapitalizationType = .none

        loginTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15.0)
        }
    }

    private func setupLoginButton() {
        view.addSubview(loginButton)

        loginButton.setTitle("Log in", for: .normal)

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}
