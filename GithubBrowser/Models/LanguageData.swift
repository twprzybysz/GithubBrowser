//
//  LanguageData.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

struct LanguageData {
    let languageName: String
    let percentage: Double
}

extension LanguageData {
    func toViewModel() -> LanguageViewModel {
        LanguageViewModel(
            title: languageName,
            subtitle: String(format: "%.2f%%", percentage)
        )
    }
}
