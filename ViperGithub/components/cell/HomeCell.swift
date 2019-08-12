//
//  HomeCell.swift
//  ViperGithub
//
//  Created by Alex Rodrigues on 12/08/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCell: UITableViewCell, ViewConfiguration {

    // MARK: - View Variables

    private lazy var ownerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8.0
        return imageView
    }()

    private lazy var ownerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .black)
        return label
    }()

    private lazy var repoNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        return label
    }()

    private lazy var totalStarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
        return label
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: - Variables

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup(repo: Repo) {
        ownerLabel.text = repo.owner?.name
        repoNameLabel.text = repo.name
        totalStarsLabel.text = "Stars: \(repo.stars ?? 0)"

        if let image = repo.owner?.profileImageUrl,
            !image.isEmpty,
            let imageUrl = URL(string: image) {
            ownerImageView.kf.indicatorType = .activity
            ownerImageView.kf.setImage(with: imageUrl)
        } else {
            ownerImageView.backgroundColor = .darkGray
        }
    }
}

// MARK: - ViewCoding
extension HomeCell {

    func configureViews() {
        backgroundColor = .clear
        labelsStackView.alignment = .leading
        labelsStackView.distribution = .fillProportionally
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 8.0
    }

    func setupViewHierarchy() {
        addSubview(ownerImageView)

        labelsStackView.addArrangedSubview(ownerLabel)
        labelsStackView.addArrangedSubview(repoNameLabel)
        labelsStackView.addArrangedSubview(totalStarsLabel)

        addSubview(labelsStackView)
    }

    func setupConstraints() {
        ownerImageView
            .topAnchor(equalTo: topAnchor, constant: 16.0, priority: .required)
            .leadingAnchor(equalTo: leadingAnchor, constant: 16.0, priority: .required)
            .heightAnchor(equalTo:88.0)
            .widthAnchor(equalTo: 88.0)

        labelsStackView
            .topAnchor(equalTo: ownerImageView.topAnchor, constant: 16.0, priority: .required)
            .leadingAnchor(equalTo: ownerImageView.trailingAnchor, constant: 16.0, priority: .required)
            .trailingAnchor(equalTo: trailingAnchor)
    }

}
