//
//  HomeRoute.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

enum HomeRoute: Route {
    case initial
    case talks
}

class HomeCoordinator: TabBarCoordinator<HomeRoute> {

    // MARK: Stored properties

    private let organizerRouter = OrganizerCoordinator().strongRouter
    private lazy var talksRouter = TalksCoordinator(parent: unownedRouter).strongRouter

    // MARK: Initialization

    init() {
        super.init(initialRoute: .initial)
    }

    // MARK: Overrides

    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .initial:
            return .multiple(
                .set([talksRouter, organizerRouter]),
                .select(organizerRouter)
            )
        case .talks:
            return .select(talksRouter)
        }
    }

}
