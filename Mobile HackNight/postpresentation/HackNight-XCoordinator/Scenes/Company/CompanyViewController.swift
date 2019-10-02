//  
//  CompanyViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    // MARK: - Views

    @IBOutlet private var logoImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    private lazy var websiteBarButtonItem =
        UIBarButtonItem(title: "Website", style: .plain,
                        target: self, action: #selector(websiteButtonTapped))

    // MARK: - Stored properties

    var company: Company? {
        didSet {
            reloadData()
        }
    }

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = websiteBarButtonItem
    }

    // MARK: - Actions

    @objc private func websiteButtonTapped() {
        guard let url = company?.website,
            UIApplication.shared.canOpenURL(url) else {
            return assertionFailure()
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // MARK: - Helpers

    private func reloadData() {
        loadViewIfNeeded()

        title = company?.name
        tabBarItem = .init(title: company?.name ?? "Company", image: #imageLiteral(resourceName: "tabBar_company"), tag: 1)
        nameLabel?.text = company?.name
        descriptionLabel?.text = company?.description
        logoImageView?.image = company?.logo
    }

}
