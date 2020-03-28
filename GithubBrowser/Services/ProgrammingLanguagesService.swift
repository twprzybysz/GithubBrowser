//
//  ProgrammingLanguagesService.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol ProgrammingLanguagesServiceDelegate: AnyObject {
    func languagesDidLoad(_ languages: Languages)
    func languagesDidLoadWithError(_ error: Error)
}

protocol ProgrammingLanguagesServiceProtocol {
    var delegate: ProgrammingLanguagesServiceDelegate? { get set }

    func getLanguageData(for repositoriesUrlString: String)
}

final class ProgrammingLanguagesService: ProgrammingLanguagesServiceProtocol {
    weak var delegate: ProgrammingLanguagesServiceDelegate?

    private let githubService: GithubServiceProtocol

    init(githubService: GithubServiceProtocol) {
        self.githubService = githubService
    }

    func getLanguageData(for repositoriesUrlString: String) {
        githubService.getRepositories(with: repositoriesUrlString) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(repositories):
                self.processRepositoriesData(repositories)
            case let .failure(error):
                self.delegate?.languagesDidLoadWithError(error)
            }
        }
    }

    private func processRepositoriesData(_ repositories: [GithubUserRepository]) {
        let languagesGroup = DispatchGroup()
        let languagesQueue = DispatchQueue(label: "com.kodely.languagesQueue")
        var languagesDictionary: Languages = [:]

        repositories.forEach { repository in
            languagesGroup.enter()
            githubService.getLanguages(in: repository.languagesUrl) { result in
                switch result {
                case .success(let languages):
                    languagesQueue.async(flags: .barrier) {
                        languagesDictionary.joinLanguagesDictionary(languages)
                        languagesGroup.leave()
                    }
                case .failure:
                    // error when fail
                    languagesGroup.leave()
                }
            }
        }

        languagesGroup.notify(queue: DispatchQueue.main) {
            self.delegate?.languagesDidLoad(languagesDictionary)
        }
    }
}
