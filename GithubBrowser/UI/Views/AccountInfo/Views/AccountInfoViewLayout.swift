//
//  AccountInfoViewLayout.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class AccountInfoViewLayout {
    let view: UIView

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        view.setupBackground()
    }
}
