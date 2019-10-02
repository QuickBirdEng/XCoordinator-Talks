//
//  TalksRoute.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import XCoordinator

//
// TASK 1.1:
//
// Create a TalksCoordinator as a NavigationCoordinator and initially push
// the `TalkListViewController` using a `TalksRoute.intial` route.
//
// Hint:
// Make sure to adapt the `prepareTransition(for:)` method in the HomeCoordinator accordingly and
// provide a default empty initializer.
//

//
// TASK 1.2:
//
// Make sure to handle the push transition to the `TalkDetailViewController` using
// the `TalksCoordinator`.
//
// Hint:
// You will need to add an `AnyRouter<TalksRoute>` to the `TalkListViewController` and
// move the transition code from `TalksListViewController.tableView(_:didSelectRowAt:)`
// into the coordinator.
//

//
// (Optional) TASK 1.3:
//
// Animate the transition to the `TalkDetailViewController` using a custom animation.
// You can use one from the Animations folder or create one on your own.
//

//
// (Optional) TASK 1.4:
//
// Add a `UIBarButtonItem` to the navigationItem of `TalkDetailViewController` to
// switch between talks without the user needing to go back to the `TalksListViewController`.
//
// Hint:
// Add an `AnyRouter` to TalkDetailViewController and trigger a new route case,
// when the item is tapped. As a transition, you can either first pop the current
// topViewController and then push a new one, or use `Transition.set` instead.
//

enum TalksRoute: Route {
    case initial
    case detail(Talk)
    case nextTalk(Talk)
}

class TalksCoordinator: NavigationCoordinator<TalksRoute> {

    init() {
        super.init(initialRoute: .initial)
    }

    override func prepareTransition(for route: TalksRoute) -> NavigationTransition {
        switch route {
        case .initial:
            let viewController = TalkListViewController()
            viewController.talks = Model.createTalks()
            viewController.router = anyRouter
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
        viewController.router = anyRouter
        return viewController
    }
}
