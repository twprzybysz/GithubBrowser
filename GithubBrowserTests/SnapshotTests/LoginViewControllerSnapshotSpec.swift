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
            describe("Login window without error") {
                itBehavesLike(LoginViewControllerSharedSnapshots.self) {
                    { _ in }
                }
            }

            describe("Login window with error") {
                itBehavesLike(LoginViewControllerSharedSnapshots.self) {
                    { $0.highlightFieldWithError(text: "Some error") }
                }
            }
        }
    }
}

private final class LoginPresenterMock: LoginPresenterProtocol {
    func didChangeUsername(_ userName: String) { }

    func loginDidTap() { }
}

private class LoginViewControllerSharedSnapshots: Behavior<(LoginViewController) -> ()> {
    override class func spec(_ specContext: @escaping () -> (LoginViewController) -> ()) {
        var sut: LoginViewController!

        beforeEach {
            sut = LoginViewController(presenter: LoginPresenterMock())
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
