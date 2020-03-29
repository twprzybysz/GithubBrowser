// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

@testable import GithubBrowser

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class GithubServiceProtocolMock: GithubServiceProtocol {

    //MARK: - getUserData

    var getUserDataForCompletionHandlerCallsCount = 0
    var getUserDataForCompletionHandlerCalled: Bool {
        return getUserDataForCompletionHandlerCallsCount > 0
    }
    var getUserDataForCompletionHandlerReceivedArguments: (userName: String, completionHandler: (Result<GithubUser, NetworkError>) -> Void)?
    var getUserDataForCompletionHandlerReceivedInvocations: [(userName: String, completionHandler: (Result<GithubUser, NetworkError>) -> Void)] = []
    var getUserDataForCompletionHandlerClosure: ((String, @escaping (Result<GithubUser, NetworkError>) -> Void) -> Void)?

    func getUserData(for userName: String, completionHandler: @escaping (Result<GithubUser, NetworkError>) -> Void) {
        getUserDataForCompletionHandlerCallsCount += 1
        getUserDataForCompletionHandlerReceivedArguments = (userName: userName, completionHandler: completionHandler)
        getUserDataForCompletionHandlerReceivedInvocations.append((userName: userName, completionHandler: completionHandler))
        getUserDataForCompletionHandlerClosure?(userName, completionHandler)
    }

    //MARK: - getRepositories

    var getRepositoriesWithCompletionHandlerCallsCount = 0
    var getRepositoriesWithCompletionHandlerCalled: Bool {
        return getRepositoriesWithCompletionHandlerCallsCount > 0
    }
    var getRepositoriesWithCompletionHandlerReceivedArguments: (repositoriesStringUrl: String?, completionHandler: (Result<[GithubUserRepository], NetworkError>) -> Void)?
    var getRepositoriesWithCompletionHandlerReceivedInvocations: [(repositoriesStringUrl: String?, completionHandler: (Result<[GithubUserRepository], NetworkError>) -> Void)] = []
    var getRepositoriesWithCompletionHandlerClosure: ((String?, @escaping (Result<[GithubUserRepository], NetworkError>) -> Void) -> Void)?

    func getRepositories(with repositoriesStringUrl: String?, completionHandler: @escaping (Result<[GithubUserRepository], NetworkError>) -> Void) {
        getRepositoriesWithCompletionHandlerCallsCount += 1
        getRepositoriesWithCompletionHandlerReceivedArguments = (repositoriesStringUrl: repositoriesStringUrl, completionHandler: completionHandler)
        getRepositoriesWithCompletionHandlerReceivedInvocations.append((repositoriesStringUrl: repositoriesStringUrl, completionHandler: completionHandler))
        getRepositoriesWithCompletionHandlerClosure?(repositoriesStringUrl, completionHandler)
    }

    //MARK: - getLanguages

    var getLanguagesInCompletionHandlerCallsCount = 0
    var getLanguagesInCompletionHandlerCalled: Bool {
        return getLanguagesInCompletionHandlerCallsCount > 0
    }
    var getLanguagesInCompletionHandlerReceivedArguments: (repositoryStringUrl: String?, completionHandler: (Result<Languages, NetworkError>) -> Void)?
    var getLanguagesInCompletionHandlerReceivedInvocations: [(repositoryStringUrl: String?, completionHandler: (Result<Languages, NetworkError>) -> Void)] = []
    var getLanguagesInCompletionHandlerClosure: ((String?, @escaping (Result<Languages, NetworkError>) -> Void) -> Void)?

    func getLanguages(in repositoryStringUrl: String?, completionHandler: @escaping (Result<Languages, NetworkError>) -> Void) {
        getLanguagesInCompletionHandlerCallsCount += 1
        getLanguagesInCompletionHandlerReceivedArguments = (repositoryStringUrl: repositoryStringUrl, completionHandler: completionHandler)
        getLanguagesInCompletionHandlerReceivedInvocations.append((repositoryStringUrl: repositoryStringUrl, completionHandler: completionHandler))
        getLanguagesInCompletionHandlerClosure?(repositoryStringUrl, completionHandler)
    }

}
class ProfileServiceDelegateMock: ProfileServiceDelegate {

    //MARK: - profileDidLoad

    var profileDidLoadCallsCount = 0
    var profileDidLoadCalled: Bool {
        return profileDidLoadCallsCount > 0
    }
    var profileDidLoadReceivedGithubUser: GithubUser?
    var profileDidLoadReceivedInvocations: [GithubUser] = []
    var profileDidLoadClosure: ((GithubUser) -> Void)?

    func profileDidLoad(_ githubUser: GithubUser) {
        profileDidLoadCallsCount += 1
        profileDidLoadReceivedGithubUser = githubUser
        profileDidLoadReceivedInvocations.append(githubUser)
        profileDidLoadClosure?(githubUser)
    }

    //MARK: - profileDidLoadWithError

    var profileDidLoadWithErrorCallsCount = 0
    var profileDidLoadWithErrorCalled: Bool {
        return profileDidLoadWithErrorCallsCount > 0
    }
    var profileDidLoadWithErrorReceivedError: Error?
    var profileDidLoadWithErrorReceivedInvocations: [Error] = []
    var profileDidLoadWithErrorClosure: ((Error) -> Void)?

    func profileDidLoadWithError(_ error: Error) {
        profileDidLoadWithErrorCallsCount += 1
        profileDidLoadWithErrorReceivedError = error
        profileDidLoadWithErrorReceivedInvocations.append(error)
        profileDidLoadWithErrorClosure?(error)
    }

}
class ProfileServiceProtocolMock: ProfileServiceProtocol {
    var delegate: ProfileServiceDelegate?

    //MARK: - getProfile

    var getProfileForCallsCount = 0
    var getProfileForCalled: Bool {
        return getProfileForCallsCount > 0
    }
    var getProfileForReceivedUsername: String?
    var getProfileForReceivedInvocations: [String] = []
    var getProfileForClosure: ((String) -> Void)?

    func getProfile(for username: String) {
        getProfileForCallsCount += 1
        getProfileForReceivedUsername = username
        getProfileForReceivedInvocations.append(username)
        getProfileForClosure?(username)
    }

}
