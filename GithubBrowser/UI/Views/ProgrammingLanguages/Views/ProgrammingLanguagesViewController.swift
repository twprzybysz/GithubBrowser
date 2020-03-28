//
//  ProgrammingLanguagesViewController.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol ProgrammingLanguagesViewProtocol: AnyObject, LoaderProtocol {
    func showLanguages(_ items: [LanguageViewModel])
}

final class ProgrammingLanguagesViewController: UIViewController {
    private let presenter: ProgrammingLanguagesPresenterProtocol
    private var layout: ProgrammingLanguagesLayout!

    private var languagesItems: [LanguageViewModel] = []

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
        setupTableView()

        presenter.viewDidLoad()
    }

    private func setupTableView() {
        let tableView = layout.itemsTableView
        tableView.registerReusableCell(ProgrammingLanguagesCell.self)
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
    }

    @objc private func didTapClose() {
        presenter.didTapClose()
    }
}

extension ProgrammingLanguagesViewController: ProgrammingLanguagesViewProtocol {
    func showLanguages(_ items: [LanguageViewModel]) {
        languagesItems = items
        layout.itemsTableView.reloadData()
    }
}

extension ProgrammingLanguagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProgrammingLanguagesCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(with: languagesItems[indexPath.row])
        cell.layoutIfNeeded()

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesItems.count
    }
}
