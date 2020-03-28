//
//  ProgrammingLanguagesPresenter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol ProgrammingLanguagesDelegate: AnyObject {
    func finish()
}

protocol ProgrammingLanguagesPresenterProtocol {
    func viewDidLoad()
    func didTapClose()
}

final class ProgrammingLanguagesPresenter {
    weak var view: ProgrammingLanguagesViewProtocol?
    weak var delegate: ProgrammingLanguagesDelegate?
}

extension ProgrammingLanguagesPresenter: ProgrammingLanguagesPresenterProtocol {
    func viewDidLoad() {
        view?.showLoader()
    }

    func didTapClose() {
        delegate?.finish()
    }
}
