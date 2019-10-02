//
//  TalksRoute.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

enum TalksRoute: Route {
    case initial
    case detail(Talk)
    case nextTalk(Talk)
}

class TalksCoordinator: NavigationCoordinator<TalksRoute> {

    init(parent: UnownedRouter<HomeRoute>) {
        super.init(initialRoute: .initial)
    }

    override func prepareTransition(for route: TalksRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let viewController = TalkListViewController()
            viewController.talks = Model.createTalks()
            viewController.router = unownedRouter
            return .push(viewController)
        case let .detail(talk):
            let viewController = detailViewController(for: talk)
            return .push(viewController, animation: .fade)
        case let .nextTalk(talk):
            let talks = Model.createTalks()

            guard let talkIndex = talks.firstIndex(where: { $0.title == talk.title }),
                let talk = talks[safe: talks.index(after: talkIndex)] ?? talks.first else {
                assertionFailure()
                return .none()
            }

            let viewController = detailViewController(for: talk)
            let viewControllers = rootViewController.viewControllers.dropLast() + [viewController]
            return .set(Array(viewControllers), animation: .fade)
        }
    }

    // MARK: - Helpers

    private func detailViewController(for talk: Talk) -> UIViewController {
        let viewController = TalkDetailViewController()
        viewController.talk = talk
        viewController.router = unownedRouter
        return viewController
    }
}
