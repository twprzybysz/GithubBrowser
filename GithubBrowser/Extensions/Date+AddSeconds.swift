//
//  Date+AddSeconds.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

extension Date {
    func addSeconds(_ seconds: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.second = seconds
        return Calendar.current.date(byAdding: dateComponents, to: self)
    }
}
