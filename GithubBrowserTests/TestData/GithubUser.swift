//
//  GithubUser.swift
//  GithubBrowserTests
//
//  Created by Tomasz Przybysz on 27/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

@testable import GithubBrowser
import Foundation

extension GithubUser {
    static let sampleUser: GithubUser = {
        let date = Date(timeIntervalSince1970: 0)

        return GithubUser(
            login: "exampleLogin",
            id: 1,
            nodeID: nil,
            rawAvatarURL: "",
            gravatarID: nil,
            url: nil,
            htmlURL: nil,
            followersURL: nil,
            followingURL: nil,
            gistsURL: nil,
            starredURL: nil,
            subscriptionsURL: nil,
            organizationsURL: nil,
            reposURL: nil, eventsURL: nil,
            receivedEventsURL: nil,
            type: nil,
            name: "Mr Very Nice",
            company: "Kode Inc",
            blog: "https://myCodingBlog",
            location: "Poland, Warsaw",
            email: nil,
            hireable: nil,
            bio: nil,
            publicRepos: 10,
            publicGists: 21,
            followers: 19,
            following: 91,
            createdAt: date,
            updatedAt: date
        )
    }()
}
