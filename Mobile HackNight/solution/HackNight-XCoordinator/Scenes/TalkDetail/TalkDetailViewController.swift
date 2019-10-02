//  
//  TalkDetailViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

class TalkDetailViewController: UIViewController {

    // MARK: - Views

    @IBOutlet private var headerImageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    // MARK: - Stored properties

    var router: AnyRouter<TalksRoute>!

    var talk: Talk? {
        didSet {
            reloadData()
        }
    }

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next talk", style: .plain,
                                                            target: self, action: #selector(nextTalkButtonTapped))
    }

    // MARK: - Actions

    @objc private func nextTalkButtonTapped() {
        guard let talk = talk else {
            return assertionFailure()
        }
        router.trigger(.nextTalk(talk))
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
