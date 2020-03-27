//
//  CorrectSnapshottingDeviceSpec.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser
import Quick
import Nimble

final class CorrectSnapshottingDeviceSpec: QuickSpec {
    override func spec() {
        describe("Simulator") {
            it("is iPhone 11 Pro Max") {
                let deviceName = ProcessInfo().environment["SIMULATOR_DEVICE_NAME"]

                expect(deviceName).to(contain("iPhone 11 Pro Max"))
            }
        }
    }
}
