//
//  LoginRoute.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import XCoordinator

//
// (Optional) TASK 4:
//
// Add some input validation to the LoginViewController and show an alert,
// if that validation failed.
//
// For example:
// Random validation, check for empty password, etc
//
// Hint 1:
// Think about where it would make most sense to handle this validation logic.
//
// Hint 2:
// Think about whether to change which routes are available in the `LoginRoute` enum.
//
// Hint 3:
// Have a look at the UIKit documentation for `UIAlertController` for information about
// how to create alerts.
//

enum LoginRoute: Route {
    case loginSuccessful
    case loginFailed
}

class LoginCoordinator: ViewCoordinator<LoginRoute> {

    init() {
        super.init(initialRoute: nil)
    }

    override func prepareTransition(for route: LoginRoute) -> ViewTransition {
        switch route {
        case .loginSuccessful:
            let coordinator = HomeCoordinator()
            return .present(coordinator)
        case .loginFailed:
            let title = "Login failed"
            let message = "Please enter a non-empty password."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            return .present(alert)
        }
    }

    override func generateRootViewController() -> UIViewController {
        let viewController = LoginViewController()
        viewController.router = anyRouter
        return viewController
    }

}
