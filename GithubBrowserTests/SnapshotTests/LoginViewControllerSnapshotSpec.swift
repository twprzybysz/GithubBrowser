//
//  LoginViewControllerSnapshotSpec.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser
import Quick
import Nimble
import SnapshotTesting

final class LoginViewControllerSnapshotSpec: QuickSpec {
    override func spec() {
        describe("LoginViewController") {
            context("Login window without error") {
                itBehavesLike(LoginViewControllerSharedSnapshots.self) { { _ in } }
            }

            context("Login window with error") {
                itBehavesLike(LoginViewControllerSharedSnapshots.self) { { $0.highlightFieldWithError(text: "Some error") } }
            }
        }
    }
}

private final class ProfileServiceMock: ProfileServiceProtocol {
    weak var delegate: ProfileServiceDelegate?

    func getProfile(for username: String) { }
}

private class LoginViewControllerSharedSnapshots: Behavior<(LoginViewController) -> ()> {
    override class func spec(_ specContext: @escaping () -> (LoginViewController) -> ()) {
        var sut: LoginViewController!
        var presenter: LoginPresenter!

        beforeEach {
            presenter = LoginPresenter(profileService: ProfileServiceMock())

            sut = LoginViewController(presenter: presenter)
            presenter.view = sut
            sut.viewDidLoad()
            specContext()(sut)
        }

        snapshotTestCases.forEach { testCase in
            context(testCase.description) {
                it("looks like as expected") {
                    expectingSnapshot(matching: sut, as: .image(on: testCase.device))
                }
            }
        }
    }
}
