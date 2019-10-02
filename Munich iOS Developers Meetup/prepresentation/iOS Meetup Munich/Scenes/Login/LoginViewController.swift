//  
//  LoginViewController.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Combine
import UIKit
import RxSwift
import XCoordinator
import XCoordinatorRx
import XCoordinatorCombine

enum LoginError: Error {
    case noPassword
}

class LoginViewController: UIViewController {

    // MARK: Views

    @IBOutlet private var passwordTextField: UITextField!

    // MARK: Overrides

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: IBActions

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let password = passwordTextField?.text ?? ""
        if password.isEmpty {
            loginFailed()
        } else {
            loginSuccessful()
        }
    }

    // MARK: Helpers

    private func loginSuccessful() {
        let talksViewController = TalkListViewController()
        talksViewController.talks = Model.createTalks()

        let talksRoot = UINavigationController(rootViewController: talksViewController)

        let organizerViewController = OrganizerViewController()
        organizerViewController.organizer = Model.createOrganizer()

        let organizerRoot = UINavigationController(rootViewController: organizerViewController)

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([talksRoot, organizerRoot], animated: false)
        tabBarController.modalPresentationStyle = .fullScreen

        present(tabBarController, animated: true, completion: nil)
    }

    private func loginFailed() {
        let title = "Login failed"
        let message = "Please enter a non-empty password."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
