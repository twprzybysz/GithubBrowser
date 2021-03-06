//
//  LoginViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: NSObject, LoaderProtocol {
    func presentError(with title: String, text: String)
    func restoreFieldStyle()
    func highlightFieldWithError(text: String)
    func clearTextField()
}

final class LoginViewController: UIViewController {
    private let presenter: LoginPresenterProtocol
    private var layout: LoginViewLayout!
    private var keyboardObserver = KeyboardObserver()

    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout = LoginViewLayout(view: view)
        title = L10n.loginTitle()

        layout.loginTextField.delegate = self
        layout.loginButton.addTarget(self, action: #selector(didTapLogIn), for: .touchUpInside)

        keyboardObserver.delegate = self
        keyboardObserver.registerObserver()

        setupLoaderContainer(view)

        view.registerKeyboardDimissOnTap()
    }

    @objc private func didTapLogIn() {
        presenter.loginDidTap()

        view.endEditing(true)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        layout.reloadStyle()
    }
}

extension LoginViewController: LoginViewProtocol {
    func restoreFieldStyle() {
        layout.setStyle(style: .normal)
    }

    func highlightFieldWithError(text: String) {
        layout.setStyle(style: .invalid, withError: text)
    }

    func clearTextField() {
        layout.loginTextField.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }

        let newText = (text as NSString)
            .replacingCharacters(in: range, with: string)
            .removingWhitespaces()
        presenter.didChangeUsername(newText)
        textField.text = newText

        restoreFieldStyle()

        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

extension LoginViewController: KeyboardObserverDelegate {
    func keyboardWillAppear(keyboardFrame: CGRect) {
        layout.bottomConstraintValue = keyboardFrame.height
    }

    func keyboardWillHide() {
        layout.bottomConstraintValue = 0
    }
}
