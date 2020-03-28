//
//  Languages+Join.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

extension Languages {
    mutating func joinLanguagesDictionary(_ languagesDictionary: Languages) {
        self = languagesDictionary.reduce(self, { result, dictionary -> Languages in
            var result = result
            let languageKey = dictionary.key
            let languageTotalBytes = (result[languageKey] ?? 0) + dictionary.value

            result[languageKey] = languageTotalBytes

            return result
        })
    }
}
