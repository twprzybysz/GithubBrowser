//
//  UIView+KeyboardDismiss.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

extension UIView {
    func registerKeyboardDimissOnTap() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
    }

    @objc private func didTapView() {
        endEditing(true)
    }
}
