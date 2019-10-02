//  
//  LoginViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

class LoginViewController: UIViewController {

    // MARK: - Stored properties

    var router: AnyRouter<LoginRoute>?

    // MARK: - Overrides

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IBActions

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        router?.trigger(.loginSuccessful)
    }

}
