//
//  ProgrammingLanguagesLayout.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class ProgrammingLanguagesLayout {
    let view: UIView
    let containerView = UIView()
    let closeButton = UIButton()
    let itemsTableView = UITableView()

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        setupContainerView()
        setupCloseButton()
        setupItemsTableView()
    }

    private func setupContainerView() {
        view.addSubview(containerView)

        containerView.setupBackground()
        containerView.layer.cornerRadius = 16.0
        containerView.layer.masksToBounds = true

        containerView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    private func setupCloseButton() {
        containerView.addSubview(closeButton)

        closeButton.setTitle(L10n.commonClose(), for: .normal)
        closeButton.setTitleColor(Colors.text(), for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 16.0)

        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(15)
        }
    }

    private func setupItemsTableView() {
        containerView.addSubview(itemsTableView)

        itemsTableView.rowHeight = UITableView.automaticDimension
        itemsTableView.estimatedRowHeight = 50.0
        itemsTableView.separatorStyle = .none

        itemsTableView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(10.0)
            make.bottom.greaterThanOrEqualTo(view.safeAreaLayoutGuide).inset(30.0)
            make.leading.trailing.equalToSuperview().inset(10.0)
        }
    }
}
