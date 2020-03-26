//
//  AppEnv.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import Swinject

struct Builders {
    let login = LoginBuilder()
    let accountInfo = AccountInfoBuilder()
}

struct Application {
    let builders = Builders()
    let container = Container()
}

let AppEnv = Application()
