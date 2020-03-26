//
//  BaseCoordinator.swift
//  GithubBrowser
//
//  Created by Tomasz Przybysz on 26/03/2020.
//  Copyright © 2020 Kodely. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinator: CoordinatorProtocol? { get set }

    func start()
    func start(coordinator: CoordinatorProtocol)
    func finish(coordinator: CoordinatorProtocol)
}

class BaseCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController = UINavigationController()
    var parentCoordinator: CoordinatorProtocol?

    private var childCoordinators: [CoordinatorProtocol] = []

    func start() {
        fatalError("Start method must be implemented")
    }

    func start(coordinator: CoordinatorProtocol) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        coordinator.start()
    }

    func finish() {
        parentCoordinator?.finish(coordinator: self)
    }

    func finish(coordinator: CoordinatorProtocol) {
        guard let index = childCoordinators.firstIndex(where: { $0 === coordinator }) else {
            print("Coordinator not found")
            return
        }

        childCoordinators.remove(at: index)
    }
}
