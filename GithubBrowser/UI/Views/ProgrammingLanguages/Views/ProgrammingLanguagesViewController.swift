//
//  ProgrammingLanguagesViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol ProgrammingLanguagesViewProtocol: AnyObject, LoaderProtocol { }

final class ProgrammingLanguagesViewController: UIViewController {
    private let presenter: ProgrammingLanguagesPresenterProtocol
    private var layout: ProgrammingLanguagesLayout!

    init(presenter: ProgrammingLanguagesPresenterProtocol) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        layout = ProgrammingLanguagesLayout(view: view)
        layout.closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)

        setupLoaderContainer(view)

        presenter.viewDidLoad()
    }

    @objc private func didTapClose() {
        presenter.didTapClose()
    }
}

extension ProgrammingLanguagesViewController: ProgrammingLanguagesViewProtocol { }
