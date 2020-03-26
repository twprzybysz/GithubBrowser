//
//  LoginViewLayout.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class LoginViewLayout {
    private enum Constants {
        static let logoSize = CGSize(width: 300, height: 200)
    }

    let view: UIView
    let itemStackView = UIStackView()
    let imageLogo = UIImageView(image: R.image.githubLogo())
    let loginTextField = TextFieldWithPadding()
    let loginButton = UIButton(type: .system)

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        view.setupBackground()
        setupItemStackView()
        setupImageLogo()
        setupLoginTextField()
        setupLoginButton()
    }

    private func setupItemStackView() {
        view.addSubview(itemStackView)

        itemStackView.axis = .vertical
        itemStackView.spacing = 10.0

        itemStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    private func setupImageLogo() {
        itemStackView.addArrangedSubview(imageLogo)

        imageLogo.contentMode = .scaleAspectFit

        imageLogo.snp.makeConstraints { make in
            make.size.equalTo(Constants.logoSize)
        }
    }

    private func setupLoginTextField() {
        itemStackView.addArrangedSubview(loginTextField)

        loginTextField.layer.borderColor = UIColor.black.cgColor
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.cornerRadius = 4.0
        loginTextField.clipsToBounds = true
        loginTextField.font = .systemFont(ofSize: 20)
        loginTextField.autocapitalizationType = .none
        loginTextField.padding = .init(top: 10, left: 20, bottom: 10, right: 20)
    }

    private func setupLoginButton() {
        itemStackView.addArrangedSubview(loginButton)

        //TODO: change name
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20.0)

        loginButton.snp.makeConstraints { make in
            //make.top.equalTo(loginTextField.snp.bottom).offset(20.0)
            make.centerX.equalToSuperview()
        }
    }
}
