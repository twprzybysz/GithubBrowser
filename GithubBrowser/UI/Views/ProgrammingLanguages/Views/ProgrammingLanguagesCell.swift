//
//  ProgrammingLanguagesCell.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapKit

final class ProgrammingLanguagesCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with data: LanguageViewModel) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }

    private func setupView() {
        setupTitleLabel()
        setupSubtitleLabel()
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)

        titleLabel.font = .systemFont(ofSize: 18.0)
        titleLabel.textColor = Colors.text()

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10.0)
            make.top.bottom.equalToSuperview().inset(15)
        }
    }

    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel)

        subtitleLabel.font = .systemFont(ofSize: 16.0)
        subtitleLabel.textColor = Colors.text()
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)

        subtitleLabel.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(titleLabel.snp.leading).offset(10.0)
            make.trailing.equalToSuperview().inset(10.0)
            make.centerY.equalToSuperview()
        }
    }
}
