//
//  AccountInfoViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit
import Kingfisher

protocol AccountInfoViewProtocol: NSObject {
    func configureView(for githubUser: GithubUser)
}

final class AccountInfoViewController: UIViewController {
    private let presenter: AccountInfoPresenterProtocol
    private var layout: AccountInfoViewLayout!

    init(presenter: AccountInfoPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout = AccountInfoViewLayout(view: view)
        layout.languagesButton.addTarget(self, action: #selector(didTapLanguages), for: .touchUpInside)
        title = L10n.accountInfoTitle()

        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))
        navigationItem.leftBarButtonItem = backButton

        presenter.viewDidLoad()
    }

    @objc private func didTapLanguages() {
        presenter.languagesDidTap()
    }

    @objc private func didTapBack() {
        presenter.didTapBack()
    }
}

extension AccountInfoViewController: AccountInfoViewProtocol {
    func configureView(for githubUser: GithubUser) {
        layout.configureView(for: githubUser)
        layout.accountImageView.kf.setImage(with: githubUser.avatarURL)
    }
}
