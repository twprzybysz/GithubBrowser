//
//  LabelBuilder.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

struct LabelBuilder {
    let title: String
    let text: String?

    func build() -> UILabel {
        let label = UILabel()

        label.attributedText = buildText()
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)

        return label
    }

    private func buildText() -> NSAttributedString {
        let baseAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0)]
        let attributedString = NSMutableAttributedString(string: title, attributes: baseAttribute)

        if let text = text {
            let attributedText = NSAttributedString(string: "\n" + text)
            attributedString.append(attributedText)
        }

        return attributedString
    }
}
