//
//  LoginRoute.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

enum LoginRoute: Route {
    case loginSuccessful
    case loginFailed
    case url(URL)
}

class LoginCoordinator: ViewCoordinator<LoginRoute> {

    init(url: URL?) {
        let viewController = LoginViewController()
        super.init(rootViewController: viewController, initialRoute: url.map(LoginRoute.url))
        viewController.router = unownedRouter
    }

    override func prepareTransition(for route: LoginRoute) -> ViewTransition {
        switch route {
        case .loginSuccessful:
            let coordinator = HomeCoordinator()
            coordinator.rootViewController.modalPresentationStyle = .fullScreen
            return .present(coordinator)
        case .loginFailed:
            let title = "Login failed"
            let message = "Please enter a non-empty password."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(.init(title: "Ok", style: .default, handler: nil))
            return .present(alert)
        case .url(let url):
            guard let talk = self.talk(from: url) else {
                return .none()
            }
            print("Navigation to TalkDetailViewController for \(talk) missing.")
            return .none()
        }
    }

    private func talk(from url: URL) -> Talk? {
        let talks = Model.createTalks()
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let items = components.queryItems,
            let talkItem = items.first(where: { $0.name.lowercased() == "name" }),
            let talk = talks.first(where: { (talkItem.value?.lowercased()).map($0.title.lowercased().starts) ?? false }) else {
                return nil
        }
        return talk
    }

}
