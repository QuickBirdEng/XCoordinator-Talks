//
//  HomeRoute.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import XCoordinator

//
// TASK 2:
//
// Make sure to select the `CompanyViewController` when transitioning from the `LoginCoordinator`
// to the `HomeCoordinator`.
//
// Hint 1:
// Try to select the `CompanyViewController` when preparing a transition
// for `HomeRoute.initial`.
//
// Hint 2:
// Have a look at `Transition.multiple` and `Transition.select` and its respective documentation.
//

enum HomeRoute: Route {
    case initial
}

class HomeCoordinator: TabBarCoordinator<HomeRoute> {

    init() {
        super.init(initialRoute: .initial)
    }

    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch route {
        case .initial:
            let companyViewController = CompanyViewController()
            companyViewController.company = Model.createCompany()
            let companyRoot = UINavigationController(rootViewController: companyViewController)

            let talkList = TalkListViewController()
            talkList.talks = Model.createTalks()
            let talkListRoot = UINavigationController(rootViewController: talkList)
            return .set([talkListRoot, companyRoot])
        }
    }
}
