//
//  OrganizerRoute.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

enum OrganizerRoute: Route {
    case initial
    case website(URL)
}

class OrganizerCoordinator: NavigationCoordinator<OrganizerRoute> {

    init() {
        super.init(initialRoute: .initial)
    }

    override func prepareTransition(for route: OrganizerRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let viewController = OrganizerViewController()
            viewController.organizer = Model.createOrganizer()
            viewController.router = unownedRouter
            return .push(viewController)
        case let .website(url):
            UIApplication.shared.open(url)
            return .none()
        }
    }
}
