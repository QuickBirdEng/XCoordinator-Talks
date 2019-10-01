//  
//  OrganizerViewController.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Combine
import UIKit
import XCoordinator
import XCoordinatorCombine

class OrganizerViewController: UIViewController {

    // MARK: Views

    @IBOutlet private var logoImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    private lazy var websiteBarButtonItem =
        UIBarButtonItem(title: "Website", style: .plain,
                        target: self, action: #selector(websiteButtonTapped))

    // MARK: Stored properties

    var organizer: Organizer? {
        didSet {
            reloadData()
        }
    }

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = websiteBarButtonItem
    }

    // MARK: Actions

    @objc private func websiteButtonTapped() {
        guard let url = organizer?.website,
            UIApplication.shared.canOpenURL(url) else {
            return assertionFailure()
        }
        UIApplication.shared.open(url)
    }

    // MARK: Helpers

    private func reloadData() {
        loadViewIfNeeded()

        title = organizer?.name
        tabBarItem = .init(title: organizer?.name ?? "Organizer", image: #imageLiteral(resourceName: "tabBar_organizer"), tag: 1)
        nameLabel?.text = organizer?.name
        descriptionLabel?.text = organizer?.description
        logoImageView?.image = organizer?.logo
    }

}
