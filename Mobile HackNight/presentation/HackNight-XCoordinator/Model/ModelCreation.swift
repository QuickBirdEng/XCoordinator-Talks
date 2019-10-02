//
//  ModelCreation.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

struct Model {

    static func createTalks() -> [Talk] {
        return [
            Talk(title: "XCoordinator",
                 subtitle: "Encapsulating transition logic with XCoordinator",
                 description: xcoordinatorDescription,
                 headerImage: #imageLiteral(resourceName: "xcoordinator_logo")),
            Talk(title: "Flutter",
                 subtitle: "How to create platform-independent apps using Flutter",
                 description: flutterDescription,
                 headerImage: #imageLiteral(resourceName: "flutter_logo"))
        ]
    }

    static func createCompany() -> Company {

        let description = """
        We’re a passionate team of mobile developers and designers based in Munich. We share one goal which is creating mobile apps that your users love to use. In a market containing millions of apps it is critical that your app does not get lost and receives the attention it deserves. We stand behind our promise to turn your idea into an app that sticks out of the mass and excites your users.

        Our brainstormers and designers assemble an intuitive concept for your idea while involving you closely into the process.

        Using an agile process and the state of the art technology standards we develop a robust application ready for the real world.

        During and after the development we support you and integrate new features based on your latest insights.
        """

        return Company(logo: #imageLiteral(resourceName: "qb_logo"),
                         name: "QuickBird Studios",
                         description: description,
                         website: URL(string: "https://www.quickbirdstudios.com")!)
    }

}

// MARK: Helpers

extension Model {

    private static var xcoordinatorDescription: String {
        return """
        Content: Let's redefine how navigation is done in iOS - this workshop will introduce you to the iOS navigation library XCoordinator. Being based on the Coordinator-pattern, it answers the common question: “How does an app transition from one ViewController to another?”. It's a navigation framework for decoupling complicated navigation and transition code from your view components.

        We’ll start with a light introduction to the Coordinator-pattern and show the pros and cons of it. Afterwards, we will dive into XCoordinator and introduce it to a small project.

        Prerequisites: This workshop is directed to mobile developers with prior knowledge in Swift/iOS-Development.

        Setup before the workshop: Please install the latest version of XCode on your machine before the workshop.
        """
    }

    private static var flutterDescription: String {
        return """
        Content: In this workshop, we will take a look at Flutter, the new star in the Cross-Platform-Sky. We first discuss how Flutter works, and what are the pros and cons compared to native development or other multi-platform approaches. Also, we will learn how widgets work, the fundamentals of Flutter, by using a little game as an example. During the actual Hack-part you will be able to implement your own movie app.

        Prerequisites: This workshop is for everybody who has a little experience in development. You do not need any prior knowledge in app development or in the dart language.

        Setup before the workshop: Please install Flutter and Android Studio or IntelliJ on your machine. You can follow this official tutorial: https://flutter.dev/docs/get-started/install
        """
    }

}
