//
//  AccountInfoViewLayout.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class AccountInfoViewLayout {
    private enum Constants {
        static let accountImageSize = CGSize(width: 150, height: 150)
        static let empty = "-"
    }

    let view: UIView
    let scrollView = UIScrollView()
    let itemStackView = UIStackView()
    let accountImageView = UIImageView(image: R.image.blank())
    let accountDataStackView = UIStackView()
    let languagesButton = UIButton(type: .system)

    init(view: UIView) {
        self.view = view
        setup()
    }

    func configureView(for githubUser: GithubUser) {
        accountDataStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        #warning("TODO: text should be in prepared in presenter")
        [
            (title: L10n.accountInfoLogin(), text: githubUser.login ?? Constants.empty),
            (title: L10n.accountInfoName(), text: githubUser.name ?? Constants.empty),
            (title: L10n.accountInfoLocation(), text: githubUser.location ?? Constants.empty),
            (title: L10n.accountInfoWebsite(), text: "\(githubUser.htmlURL ?? Constants.empty)"),
            (title: L10n.accountInfoCompany(), text: "\(githubUser.company ?? Constants.empty)"),
            (title: L10n.accountInfoFollowers(), text: "\(githubUser.followers ?? 0)"),
            (title: L10n.accountInfoFollowing(), text: "\(githubUser.following ?? 0)"),
            (title: L10n.accountInfoCreationDate(), text: "\(DateFormatter.format(date: githubUser.createdAt))"),
            (title: L10n.accountInfoUpdateDate(), text: " \(DateFormatter.format(date: githubUser.updatedAt))"),
            (title: L10n.accountInfoPublicGists(), text: "\(githubUser.publicGists ?? 0)"),
            (title: L10n.accountInfoPublicRepositories(), text: "\(githubUser.publicRepos ?? 0)")
        ].forEach { item in
            let label = LabelBuilder(title: item.title, text: item.text).build()
            let wrappedLabel = wrapWithMarginView(textLabel: label)
            accountDataStackView.addArrangedSubview(wrappedLabel)
        }
    }

    private func setup() {
        view.setupBackground()
        setupScrollView()
        setupItemStackView()
        setupAccountImageView()
        setupAccountDataStackView()
        setupLanguagesButton()
    }

    private func setupScrollView() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupItemStackView() {
        scrollView.addSubview(itemStackView)

        itemStackView.axis = .vertical

        itemStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView.snp.width)
        }
    }

    private func setupAccountImageView() {
        let imageWrapView = UIView()
        itemStackView.addArrangedSubview(imageWrapView)
        itemStackView.setCustomSpacing(15.0, after: imageWrapView)

        imageWrapView.addSubview(accountImageView)

        accountImageView.snp.makeConstraints { make in
            make.size.equalTo(Constants.accountImageSize)
            make.top.bottom.centerX.equalToSuperview()
        }
    }

    private func setupAccountDataStackView() {
        itemStackView.addArrangedSubview(accountDataStackView)

        accountDataStackView.axis = .vertical
        accountDataStackView.spacing = 10.0
    }

    private func setupLanguagesButton() {
        let wrapView = UIView()
        wrapView.addSubview(languagesButton)

        languagesButton.snp.makeConstraints { make in
            make.edges
                .equalToSuperview()
                .inset(UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30))
        }

        itemStackView.addArrangedSubview(wrapView)

        languagesButton.setTitle(L10n.accountInfoShowLanguages(), for: .normal)
        languagesButton.setTitleColor(Colors.text(), for: .normal)
        languagesButton.titleLabel?.font = .systemFont(ofSize: 16.0)
        languagesButton.layer.borderColor = Colors.text()?.cgColor
        languagesButton.layer.borderWidth = 1.0
        languagesButton.layer.cornerRadius = 4.0
    }

    private func wrapWithMarginView(textLabel: UILabel) -> UIView {
        let labelWrapView = UIView()
        labelWrapView.addSubview(textLabel)

        textLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20.0)
        }

        return labelWrapView
    }
}
