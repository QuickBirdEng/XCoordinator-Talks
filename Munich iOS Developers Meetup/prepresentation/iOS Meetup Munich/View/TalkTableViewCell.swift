//
//  TalkTableViewCell.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import UIKit

class TalkTableViewCell: UITableViewCell {

    // MARK: - Views

    let talkImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    let talkTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.numberOfLines = 0
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    let talkSubtitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.numberOfLines = 0
        view.textColor = .gray
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    private let talkContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.25
        return view
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Overrides

    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        UIView.animate(withDuration: animated ? 0.35 : 0) {
            self.talkContainerView.layer.shadowOpacity = highlighted ? 0.5 : 0.25
        }
    }

    // MARK: - Setup

    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        setupContainerView()
    }

    private func setupContainerView() {
        contentView.addSubview(talkContainerView)

        let aspectRatioConstraint = talkContainerView.widthAnchor
            .constraint(equalTo: talkContainerView.heightAnchor, multiplier: 1.5)
        aspectRatioConstraint.priority = .defaultHigh

        NSLayoutConstraint.activate([
            talkContainerView.topAnchor
                .constraint(equalTo: contentView.topAnchor, constant: 8),
            talkContainerView.leadingAnchor
                .constraint(equalTo: contentView.leadingAnchor, constant: 16),
            talkContainerView.trailingAnchor
                .constraint(equalTo: contentView.trailingAnchor, constant: -16),
            talkContainerView.bottomAnchor
                .constraint(equalTo: contentView.bottomAnchor, constant: -8),
            aspectRatioConstraint
        ])

        setupImageView()
        setupLabels()
    }

    private func setupImageView() {
        talkContainerView.addSubview(talkImageView)

        NSLayoutConstraint.activate([
            talkImageView.topAnchor
                .constraint(equalTo: talkContainerView.topAnchor, constant: 16),
            talkImageView.leadingAnchor
                .constraint(equalTo: talkContainerView.leadingAnchor, constant: 16),
            talkImageView.trailingAnchor
                .constraint(equalTo: talkContainerView.trailingAnchor, constant: -16)
        ])
    }

    private func setupLabels() {
        talkContainerView.addSubview(talkTitleLabel)
        talkContainerView.addSubview(talkSubtitleLabel)

        NSLayoutConstraint.activate([
            talkTitleLabel.topAnchor
                .constraint(equalTo: talkImageView.bottomAnchor, constant: 8),
            talkTitleLabel.leadingAnchor
                .constraint(equalTo: talkContainerView.leadingAnchor, constant: 16),
            talkTitleLabel.trailingAnchor
                .constraint(equalTo: talkContainerView.trailingAnchor, constant: -16),

            talkSubtitleLabel.topAnchor
                .constraint(equalTo: talkTitleLabel.bottomAnchor, constant: 8),
            talkSubtitleLabel.leadingAnchor
                .constraint(equalTo: talkContainerView.leadingAnchor, constant: 16),
            talkSubtitleLabel.trailingAnchor
                .constraint(equalTo: talkContainerView.trailingAnchor, constant: -16),
            talkSubtitleLabel.bottomAnchor
                .constraint(equalTo: talkContainerView.bottomAnchor, constant: -16),
        ])
    }
}
