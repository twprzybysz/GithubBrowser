//
//  KeyboardObserver.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol KeyboardObserverDelegate: class {
    func keyboardWillHide()
    func keyboardWillAppear(keyboardFrame: CGRect)
}

final class KeyboardObserver {
    weak var delegate: KeyboardObserverDelegate?

    func registerObserver() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    func unregisterObserver() {
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: self
        )
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: self
        )
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        delegate?.keyboardWillHide()
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        let keyboardFrameData = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
        guard let keyboardSize = (keyboardFrameData as? NSValue)?.cgRectValue else {
            return
        }

        delegate?.keyboardWillAppear(keyboardFrame: keyboardSize)
    }
}
