//
//  DispatchQueueProtocol.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 03/04/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: work)
    }
}
