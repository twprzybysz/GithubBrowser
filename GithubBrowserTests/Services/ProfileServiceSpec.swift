//
//  ProfileServiceSpec.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 29/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser
import Quick
import Nimble

final class ProfileServiceSpec: QuickSpec {
    override func spec() {
        let username = "githubUsername"

        describe("ProfileService") {
            var sut: ProfileService!
            var githubService: GithubServiceProtocolMock!
            var cacheManager: CacheProtocolMock!
            var delegate: ProfileServiceDelegateMock!

            beforeEach {
                githubService = GithubServiceProtocolMock()
                cacheManager = CacheProtocolMock()
                delegate = ProfileServiceDelegateMock()

                sut = ProfileService(githubService: githubService, cacheManager: cacheManager)
                sut.delegate = delegate
            }

            describe("gets profile when cache is filled") {
                beforeEach {
                    cacheManager.loadFromCacheReceivedObject = GithubUser.sampleUser
                    sut.getProfile(for: username)
                }

                it("calls profileDidLoad via delegate") {
                    expect(delegate.profileDidLoadCalled).to(beTrue())
                }
            }

            describe("gets profile when cache is empty") {
                describe("network don't cause problems") {
                    beforeEach {
                        githubService.getUserDataForCompletionHandlerClosure = { _, completion in
                            completion(.success(GithubUser.sampleUser))
                        }
                        sut.getProfile(for: username)
                    }

                    it("calls githubService for user data") {
                        expect(githubService.getUserDataForCompletionHandlerCalled).to(beTrue())
                    }

                    it("saves fetched user data to cache") {
                        expect(cacheManager.saveToCacheCalled).to(beTrue())
                    }

                    it("calls profileDidLoad via delegate") {
                        expect(delegate.profileDidLoadCalled).to(beTrue())
                    }
                }

                describe("network is down") {
                    beforeEach {
                        githubService.getUserDataForCompletionHandlerClosure = { _, completion in
                            completion(.failure(NetworkError.error))
                        }
                        sut.getProfile(for: username)
                    }

                    it("calls githubService for user data") {
                        expect(githubService.getUserDataForCompletionHandlerCalled).to(beTrue())
                    }

                    it("calls profileDidLoadWithError via delegate") {
                        expect(delegate.profileDidLoadWithErrorCalled).to(beTrue())
                    }
                }
            }
        }
    }
}
