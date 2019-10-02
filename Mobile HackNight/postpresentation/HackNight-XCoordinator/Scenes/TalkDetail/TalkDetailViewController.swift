//  
//  TalkDetailViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

class TalkDetailViewController: UIViewController {

    // MARK: - Views

    @IBOutlet private var headerImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    // MARK: - Stored properties

    var talk: Talk? {
        didSet {
            reloadData()
        }
    }

    // MARK: - Helpers

    private func reloadData() {
        loadViewIfNeeded()

        title = talk?.title
        headerImageView.image = talk?.headerImage
        titleLabel?.text = talk?.title
        subtitleLabel?.text = talk?.subtitle
        descriptionLabel?.text = talk?.description
    }

}
