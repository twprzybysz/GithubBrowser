//
//  TextFieldWithPadding.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

final class TextFieldWithPadding: UITextField {
    var padding: UIEdgeInsets = .zero {
        didSet {
            setNeedsLayout()
        }
    }

    init(padding: UIEdgeInsets = .zero) {
        self.padding = padding

        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds).inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds).inset(by: padding)
    }
}
