//
//  CompanyRoute.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import XCoordinator

//
// TASK 3.1:
//
// Create a `CompanyCoordinator` with a `UINavigationController` rootViewController and
// a `CompanyRoute.initial` route to push the `CompanyViewController`.
//
// Hint:
// Make sure to adapt the `prepareTransition(for:)` method in the `HomeCoordinator` accordingly.
//

//
// (Optional) TASK 3.2:
//
// Add a `CompanyRoute` case to trigger the `UIApplication.shared.open` call in the `CompanyViewController`.
//

enum CompanyRoute: Route {
    case initial
    case website(URL)
}

class CompanyCoordinator: NavigationCoordinator<CompanyRoute> {

    init() {
        super.init(initialRoute: .initial)
    }

    override func prepareTransition(for route: CompanyRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let viewController = CompanyViewController()
            viewController.company = Model.createCompany()
            viewController.router = anyRouter
            return .push(viewController)
        case let .website(url):
            UIApplication.shared.open(url)
            return .none()
        }
    }
}
