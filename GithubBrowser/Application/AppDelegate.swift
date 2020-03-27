//
//  AppDelegate.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var appCoordinator: CoordinatorProtocol?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // This needs to be created here because its the right place to initialize window when using SVProgressHUD
        window = UIWindow(frame: UIScreen.main.bounds)

        AppEnv.container.registerDependencies()

        appCoordinator = AppEnv.container.resolve(AppCoordinator.self, argument: window!)!
        appCoordinator?.start()

        return true
    }
}
