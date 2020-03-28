//
//  ReusableView.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var reuseId: String { get }
}

extension ReusableView {
    static var reuseId: String {
        String(describing: self)
    }
}

extension UITableViewCell: ReusableView { }
