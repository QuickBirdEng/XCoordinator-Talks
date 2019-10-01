//  
//  LoginViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Overrides

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IBActions

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let companyViewController = CompanyViewController()
        companyViewController.company = Model.createCompany()
        let companyRoot = UINavigationController(rootViewController: companyViewController)

        let talkList = TalkListViewController()
        talkList.talks = Model.createTalks()
        let talkListRoot = UINavigationController(rootViewController: talkList)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [talkListRoot, companyRoot]
        present(tabBarController, animated: true, completion: nil)
    }

}
