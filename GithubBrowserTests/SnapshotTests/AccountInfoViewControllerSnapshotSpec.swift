//
//  AccountInfoViewControllerSnapshotSpec.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser
import Quick
import Nimble
import SnapshotTesting

final class AccountInfoViewControllerSnapshotSpec: QuickSpec {
    override func spec() {
        var sut: AccountInfoViewController!

        beforeEach {
            sut = AccountInfoViewController(presenter: AccountInfoPresenterMock())
            sut.viewDidLoad()
            sut.configureView(for: GithubUser.sampleUser)
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

private final class AccountInfoPresenterMock: AccountInfoPresenterProtocol {
    func viewDidLoad() { }
}
