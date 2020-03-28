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
    let somePlainView = UIView()
    let closeButton = UIButton()

    init(view: UIView) {
        self.view = view
        setup()
    }

    private func setup() {
        setupView()
        setupCloseButton()
    }

    private func setupView() {
        view.addSubview(somePlainView)

        somePlainView.setupBackground()
        somePlainView.layer.cornerRadius = 16.0
        somePlainView.layer.masksToBounds = true

        somePlainView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupCloseButton() {
        somePlainView.addSubview(closeButton)

        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(Colors.text(), for: .normal)
        closeButton.titleLabel?.font = .systemFont(ofSize: 16.0)

        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().inset(15)
        }
    }
}
