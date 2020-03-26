//
//  DateFormatter+Format.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Foundation

extension DateFormatter {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy HH:mm:ss"
        return dateFormatter
    }()

    static func format(date: Date?) -> String {
        guard let date = date else { return "" }

        return DateFormatter.dateFormatter.string(from: date)
    }
}
