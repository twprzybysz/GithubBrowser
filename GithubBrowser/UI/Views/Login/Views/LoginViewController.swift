//
//  LoginViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol LoginViewProtocol: NSObject {
    func presentError(with title: String, text: String)
    func showLoader()
    func dismissLoader()
    func restoreFieldStyle()
    func highlightFieldWithError(text: String)
}

final class LoginViewController: UIViewController {

    private let presenter: LoginPresenterProtocol
    private var layout: LoginViewLayout!

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
        title = "Github browser"

        layout.loginTextField.delegate = self
        layout.loginButton.addTarget(self, action: #selector(didTapLogIn), for: .touchUpInside)
    }

    @objc private func didTapLogIn() {
        presenter.loginDidTap()

        view.endEditing(true)
    }
}

extension LoginViewController: LoginViewProtocol {
    func showLoader() {
        SVProgressHUD.show()
    }

    func dismissLoader() {
        SVProgressHUD.dismiss()
    }

    func restoreFieldStyle() {
        layout.setStyle(style: .normal)
    }

    func highlightFieldWithError(text: String) {
        layout.setStyle(style: .invalid, withError: text)
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
