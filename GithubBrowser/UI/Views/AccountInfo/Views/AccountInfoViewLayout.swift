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
    let scrollView = UIScrollView()
    let itemStackView = UIStackView()
    let accountImageView = UIImageView(image: R.image.githubLogo())

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        view.setupBackground()
        setupScrollView()
        setupItemStackView()
        setupAccountImageView()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupItemStackView() {
        scrollView.addSubview(itemStackView)

        itemStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupAccountImageView() {
        itemStackView.addArrangedSubview(accountImageView)
    }
}
