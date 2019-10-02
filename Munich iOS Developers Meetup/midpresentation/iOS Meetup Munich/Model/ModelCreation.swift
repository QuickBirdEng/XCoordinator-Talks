//
//  ModelCreation.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

struct Model {

    static func createTalks() -> [Talk] {
        return [
            Talk(title: "XCoordinator - A powerful navigation library for iOS based on the Coordinator pattern",
                 subtitle: "Paul Kraft - QuickBird Studios",
                 description: coordinatorTalkDescription,
                 headerImage: #imageLiteral(resourceName: "xcoordinator_logo")),
            Talk(title: "A generic solution for offline persistence of user interactions",
                 subtitle: "Karim Alweheshy - United Internet AG",
                 description: persistenceTalkDescription,
                 headerImage: #imageLiteral(resourceName: "persistence_logo"))
        ]
    }

    static func createOrganizer() -> Organizer {

        let description = """
        Welcome to the Munich iOS Developers meetup group. This is a group to learn and share iOS experiences. Use this group to learn tricks, network with other iOS developers, share your experiences and see interesting presentations or demos.

        If you're interested about speaking on any iOS related topic, or presenting your app please contact us.

        We also have a Slack channel were we discuss anything related to iOS, send us a private message and we will add you the channel.

        Some of the talks are also available on YouTube.
        """

        return Organizer(logo: #imageLiteral(resourceName: "organizer_logo"),
                       name: "Munich iOS Developers Meetup",
                       description: description,
                       website: URL(string: "https://www.meetup.com/The-Munich-iOS-Developers-Meetup/")!)
    }

}

// MARK: Helpers

extension Model {

    private static var coordinatorTalkDescription: String {
        return """
        Let’s redefine how navigation is done in iOS. This presentation will introduce you to the iOS navigation library XCoordinator. Being based on the Coordinator-pattern, it answers the common question: “How does an app transition from one ViewController to another?“. It’s a navigation framework for decoupling complicated navigation and transition code from your view components. We’ll start with a light introduction to the Coordinator-pattern and show the pros and cons of it. Afterwards, we will dive into XCoordinator and introduce it to a small project.
        """
    }

    private static var persistenceTalkDescription: String {
        return """
        Ever worked with offline data on iOS? Then you might also have written some code to avoid/fix race conditions. Synk is our in-house solution in 1&1 using Core Data and URLSession. Not only it avoids race conditions on the lowest levels, it asserts sequential executions, it also helps with (re-)authentication, it executes requests on the background, retries in case of client error and it persists to CoreData.
        """
    }

}
