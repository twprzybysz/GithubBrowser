//
//  LoaderProtocol.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 28/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import SVProgressHUD

protocol LoaderProtocol {
    func showLoader()
    func dismissLoader()
}

extension LoaderProtocol {
    func setupLoaderContainer(_ container: UIView) {
        SVProgressHUD.setContainerView(container)
    }

    func showLoader() {
        SVProgressHUD.show()
    }

    func dismissLoader() {
        SVProgressHUD.dismiss()
    }
}
