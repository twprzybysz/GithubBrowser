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

    private var programmingLanguagesService: ProgrammingLanguagesServiceProtocol
    private let repositoriesStringURL: String

    init(programmingLanguagesService: ProgrammingLanguagesServiceProtocol, repositoriesStringURL: String) {
        self.programmingLanguagesService = programmingLanguagesService
        self.repositoriesStringURL = repositoriesStringURL
        self.programmingLanguagesService.delegate = self
    }
}

extension ProgrammingLanguagesPresenter: ProgrammingLanguagesPresenterProtocol {
    func viewDidLoad() {
        view?.showLoader()

        programmingLanguagesService.getLanguageData(for: repositoriesStringURL)
    }

    func didTapClose() {
        delegate?.finish()
    }
}

extension ProgrammingLanguagesPresenter: ProgrammingLanguagesServiceDelegate {
    func languagesDidLoad(_ languages: Languages) {
        self.view?.dismissLoader()

        let totalBytesCount = Double(languages.reduce(0, { $0 + $1.value }))
        var languagesModel = languages.map { languageKey, languageTotalBytesCount -> LanguageData in
            let percentage = Double(100) * (Double(languageTotalBytesCount) / totalBytesCount)

            return LanguageData(languageName: languageKey, percentage: percentage)
        }

        languagesModel.sort { lhs, rhs -> Bool in lhs.percentage > rhs.percentage }

        self.view?.showLanguages(languagesModel.map { $0.toViewModel() })
    }

    func languagesDidLoadWithError(_ error: Error) {
        self.view?.dismissLoader()
        self.view?.showError(text: error.localizedDescription)
    }
}
