//
//  Quick+ExpectingSnapshot.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Quick
import SnapshotTesting

func expectingSnapshot<Value, Format>(
    matching value: @autoclosure () throws -> Value,
    as snapshotting: Snapshotting<Value, Format>,
    named name: String? = nil,
    record isRecording: Bool = false,
    file: StaticString = #file,
    line: UInt = #line
) {
    assertSnapshot(
        matching: try value(),
        as: snapshotting,
        record: isRecording,
        file: file,
        testName: QuickSpec.current.name,
        line: line
    )
}
