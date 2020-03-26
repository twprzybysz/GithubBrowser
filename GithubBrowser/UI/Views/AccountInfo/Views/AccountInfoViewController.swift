//
//  AccountInfoViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol AccountInfoViewProtocol: NSObject { }

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
        title = "Account info"
    }
}

extension AccountInfoViewController: AccountInfoViewProtocol { }
