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

    init(view: UIView) {
        self.view = view
        setup()
    }

    func configureView(for githubUser: GithubUser) {
        accountDataStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        insertLabelWith(title: L10n.accountInfoLogin(), text: "\(githubUser.login ?? Constants.empty)")
        insertLabelWith(title: L10n.accountInfoName(), text: "\(githubUser.name ?? Constants.empty)")
        insertLabelWith(title: L10n.accountInfoLocation(), text: "\(githubUser.location ?? Constants.empty)")
        insertLabelWith(title: L10n.accountInfoWebsite(), text: "\(githubUser.htmlURL ?? Constants.empty)")
        insertLabelWith(title: L10n.accountInfoCompany(), text: "\(githubUser.company ?? Constants.empty)")
        insertLabelWith(title: L10n.accountInfoFollowers(), text: "\(githubUser.followers ?? 0)")
        insertLabelWith(title: L10n.accountInfoFollowing(), text: "\(githubUser.following ?? 0)")
        insertLabelWith(title: L10n.accountInfoCreationDate(), text: "\(DateFormatter.format(date: githubUser.createdAt))")
        insertLabelWith(title: L10n.accountInfoUpdateDate(), text: " \(DateFormatter.format(date: githubUser.updatedAt))")
        insertLabelWith(title: L10n.accountInfoPublicGists(), text: "\(githubUser.publicGists ?? 0)")
        insertLabelWith(title: L10n.accountInfoPublicRepositories(), text: "\(githubUser.publicRepos ?? 0)")
    }

    private func setup() {
        view.setupBackground()
        setupScrollView()
        setupItemStackView()
        setupAccountImageView()
        setupAccountDataStackView()
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

    private func insertLabelWith(title: String, text: String? = nil) {
        let itemLabel = UILabel()

        let baseAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]
        let attributedString = NSMutableAttributedString(string: title, attributes: baseAttribute)
        if let text = text {
            let attributedText = NSAttributedString(string: "\n" + text)
            attributedString.append(attributedText)
        }

        itemLabel.attributedText = attributedString
        itemLabel.numberOfLines = 0
        itemLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        let labelWrapView = UIView()
        labelWrapView.addSubview(itemLabel)

        itemLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20.0)
        }

        accountDataStackView.addArrangedSubview(labelWrapView)
    }
}
