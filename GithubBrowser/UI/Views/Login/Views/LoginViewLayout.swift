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

    enum Style {
        case normal
        case invalid

        var mainColor: UIColor? {
            switch self {
            case .normal: return Colors.background()
            case .invalid: return Colors.error()
            }
        }

        var baseColor: UIColor? {
            switch self {
            case .normal: return Colors.text()
            case .invalid: return Colors.error()
            }
        }
    }

    let view: UIView
    let itemStackView = UIStackView()
    let keyboardAreaView = UIView()
    let imageLogo = UIImageView(image: R.image.githubLogo())
    let loginLabel = UILabel()
    let loginTextField = TextFieldWithPadding()
    let errorLabel = UILabel()
    let loginButton = UIButton(type: .system)

    private var bottomConstraint: Constraint?
    private var lastKnownStyle: Style = .normal
    private var lastErrorText: String = ""

    var bottomConstraintValue: CGFloat = 0 {
        didSet {
            bottomConstraint?.update(inset: bottomConstraintValue)
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }

    init(view: UIView) {
        self.view = view
        setup()
    }

    func reloadStyle() {
        setStyle(style: lastKnownStyle, withError: lastErrorText)
    }

    func setStyle(style: Style, withError text: String = "") {
        loginLabel.textColor = style.baseColor
        loginTextField.layer.borderColor = style.baseColor?.cgColor
        errorLabel.text = text
        errorLabel.textColor = style.mainColor

        lastErrorText = text
        lastKnownStyle = style
    }

    private func setup() {
        view.setupBackground()
        setupItemStackView()
        setupKeyboardAreaView()
        setupImageLogo()
        setupLoginLabel()
        setupLoginTextField()
        setupErrorLabel()
        setupLoginButton()

        setStyle(style: .normal)
    }

    private func setupItemStackView() {
        view.addSubview(itemStackView)

        itemStackView.axis = .vertical
        itemStackView.spacing = 10.0

        itemStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().priority(.low)
        }
    }

    private func setupKeyboardAreaView() {
        view.addSubview(keyboardAreaView)

        keyboardAreaView.snp.makeConstraints { make in
            make.top.equalTo(itemStackView.snp.bottom)
            make.leading.trailing.equalToSuperview()

            bottomConstraint = make.bottom.equalTo(view.safeAreaLayoutGuide).constraint
        }
    }

    private func setupImageLogo() {
        itemStackView.addArrangedSubview(imageLogo)

        imageLogo.contentMode = .scaleAspectFit

        imageLogo.snp.makeConstraints { make in
            make.size.equalTo(Constants.logoSize)
        }
    }

    private func setupLoginLabel() {
        itemStackView.addArrangedSubview(loginLabel)

        loginLabel.text = L10n.loginLabel()
        loginLabel.font = .systemFont(ofSize: 12.0)
    }

    private func setupLoginTextField() {
        itemStackView.addArrangedSubview(loginTextField)

        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.cornerRadius = 4.0
        loginTextField.clipsToBounds = true
        loginTextField.font = .systemFont(ofSize: 20)
        loginTextField.autocapitalizationType = .none
        loginTextField.padding = .init(top: 10, left: 20, bottom: 10, right: 20)
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: L10n.loginPlaceholder(),
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeholder()!]
        )
        loginTextField.clearsOnBeginEditing = true
        loginTextField.textColor = Colors.text()
    }

    private func setupErrorLabel() {
        itemStackView.addArrangedSubview(errorLabel)

        errorLabel.font = .systemFont(ofSize: 12.0)
    }

    private func setupLoginButton() {
        itemStackView.addArrangedSubview(loginButton)

        //TODO: change name
        loginButton.setTitle(L10n.loginButton(), for: .normal)
        loginButton.setTitleColor(Colors.text(), for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 20.0)
    }
}
