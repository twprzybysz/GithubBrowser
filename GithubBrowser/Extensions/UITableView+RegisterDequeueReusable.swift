//
//  UITableView+RegisterDequeueReusable.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

extension UITableView {
    func registerReusableCell(_ cellClass: UITableViewCell.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseId)
    }

    func dequeueReusableCell<T: ReusableView>(for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
    }
}
