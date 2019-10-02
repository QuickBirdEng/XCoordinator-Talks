//  
//  TalkListViewController.swift
//  HackNight-XCoordinator
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit
import XCoordinator

class TalkListViewController: UIViewController {

    // MARK: - Views

    @IBOutlet private var tableView: UITableView!

    // MARK: Stored properties

    private let cellIdentifier = String(describing: TalkTableViewCell.self)

    var router: AnyRouter<TalksRoute>!

    var talks: [Talk] = [] {
        didSet {
            reloadData()
        }
    }

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Talks"

        view.backgroundColor = .white
        tableView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
        tabBarItem = .init(title: "Talks", image: #imageLiteral(resourceName: "tabBar_talkList"), tag: 0)
        tableView.contentInset.bottom += 8
        tableView.contentInset.top += 8
        tableView.register(TalkTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Helpers

    private func reloadData() {
        loadViewIfNeeded()

        tableView?.reloadData()
    }

}

// MARK: - UITableViewDelegate

extension TalkListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = talks[indexPath.row]
        router.trigger(.detail(model))
    }

}

// MARK: - UITableViewDataSource

extension TalkListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return talks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = talks[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TalkTableViewCell
        cell.talkImageView.image = model.headerImage
        cell.talkTitleLabel.text = model.title
        cell.talkSubtitleLabel.text = model.subtitle
        return cell
    }

}
