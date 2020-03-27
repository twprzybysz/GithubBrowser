//
//  SnapshotTestCases.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SnapshotTesting

let snapshotTestCases = [
    SnapshotTestCase(
        description: "iPhone SE", device: .iPhoneSe
    ),
    SnapshotTestCase(
        description: "iPhone 8 Plus", device: .iPhone8Plus
    ),
    SnapshotTestCase(
        description: "iPhone X", device: .iPhoneX
    ),
    SnapshotTestCase(
        description: "iPadMini", device: .iPadMini
    )
]

struct SnapshotTestCase {
    var description: String
    var device: ViewImageConfig
}
