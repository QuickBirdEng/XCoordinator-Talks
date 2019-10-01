//
//  AppDelegate.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Stored properties

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    let coordinator = LoginCoordinator()

    // MARK: - UIApplicationDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.setRoot(for: window!)
        return true
    }

}
