//
//  LoginViewPresenter.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

protocol LoginPresenterDelegate: AnyObject {
    func showAccountInfo()
}

protocol LoginPresenterProtocol: AnyObject {
    func didChangeUsername(_ userName: String)
    func loginDidTap()
}

final class LoginPresenter {
    weak var view: LoginViewProtocol?
    weak var delegate: LoginPresenterDelegate?

    private var userName = ""
    private var networkProvider: NetworkProviderProtocol

    init(networkProvider: NetworkProviderProtocol) {
        self.networkProvider = networkProvider
    }

    private func fetchData(with username: String) {
        networkProvider.getUserData(for: username) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(githubUser):
                self.delegate?.showAccountInfo()
            case let .failure(error):
                self.view?.presentError(with: "Error", text: error.localizedDescription)
            }
        }

        // SHOW LOADER
        /*
        get(with: buildUrl(with: username), decoder: .withIso8601DateDecoder) { [weak self] (reposObj: GithubUser?) in
            guard let reposObj = reposObj, reposObj.isValid else {
                self?.view?.presentError(with:  "Error", text: "No user found")
                return
            }

            //self?.githubUserResponse = reposObj
            self?.fetchRepos(with: reposObj.reposURL ?? "") { [weak self] languages in
                //self?.githubLanguages = languages
                //UIApplication.shared.isNetworkActivityIndicatorVisible = false
                //self?.performSegue(withIdentifier: Constants.showResultsSegue, sender: nil)
            }
        }
        */
    }

    /*
    private func fetchRepos(with reposUrl: String, completion: @escaping (Languages) -> ()) {
        let languagesGroup = DispatchGroup()
        let languagesQueue = DispatchQueue(label: "languagesQueue")
        var languages: Languages = [:]

        languagesGroup.enter()
        get(with: reposUrl) { [weak self] (reposObj: [GithubUserRepository]?) in
            reposObj?.forEach { repoObj in
                languagesGroup.enter()

                self?.get(with: repoObj.languagesUrl) { (languagesObj: Languages?) in
                    languagesQueue.async(flags: .barrier) {
                        languages = languagesObj?.reduce(languages, { (result, kv) -> Languages in
                            var result = result
                            result[kv.key] = (result[kv.key] ?? 0) + kv.value
                            return result
                        }) ?? [:]
                        languagesGroup.leave()
                    }
                }
            }
            languagesGroup.leave()
        }

        languagesGroup.notify(queue: DispatchQueue.main) {
            completion(languages)
        }
    }

    private func get<T: Decodable>(with reposUrl: String, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (T?) -> ()) {
        guard let url = URL(string: reposUrl) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
             DispatchQueue.main.async {
                guard let data = data else { return completion(nil) }

                completion(try? decoder.decode(T.self, from: data))
            }
        }.resume()
    }

    private func buildUrl(with username: String) -> String {
        let parameters = [
            "client_id": Constants.clientId,
            "client_secret": Constants.clientSecret
            ]
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
        return "\(Constants.baseUrl)\(username)?\(parameters)"
    }
    */
}

extension LoginPresenter: LoginPresenterProtocol {
    func didChangeUsername(_ userName: String) {
        self.userName = userName
    }

    func loginDidTap() {
        fetchData(with: userName)
    }
}
