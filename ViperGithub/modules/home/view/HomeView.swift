//
//  HomeView.swift
//  ViperGithub
//
//  Created Alex Rodrigues on 08/08/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class HomeView: UIViewController, ViewConfiguration {

	// MARK: - Viper Module Properties
	
    var presenter: HomePresenterInputProtocol!

    // MARK: - Variables
    
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()

    private lazy var homeTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorColor = UIColor(white: 1.0, alpha: 0.6)
        tableView.backgroundColor = .clear
        return tableView
    }()

    private let homeCellIdentifier = "HOME_CELL"
    private var repos = [Repo]()

	// MARK: - Override methods
	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

	// MARK: - Private Methods
    
}

// MARK: - HomePresenterOutputProtocol

extension HomeView: HomePresenterOutputProtocol {
    
    func setupViewCoding() {
        setupViews()
    }

    func didFetchedRepos(repos: [Repo]) {
        self.repos = repos
        homeTableView.reloadData()
        homeTableView.isHidden = false
        activityIndicatorView.stopAnimating()
    }

    func failedFetchRepos(message: String) {
        showErrorAlert(message)
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: homeCellIdentifier, for: indexPath) as? HomeCell else { return UITableViewCell() }

        cell.setup(repo: repos[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}

// MARK: - View Coding

extension HomeView {
    
    func configureViews() {
        activityIndicatorView.startAnimating()

        homeTableView.register(HomeCell.self, forCellReuseIdentifier: homeCellIdentifier)
        homeTableView.isHidden = true
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    func setupViewHierarchy() {
        view.addSubview(activityIndicatorView)
        view.addSubview(homeTableView)
    }
    
    func setupConstraints() {
        
        activityIndicatorView
            .centerXAnchor(equalTo: view.centerXAnchor)
            .centerYAnchor(equalTo: view.centerYAnchor)

        homeTableView
            .topAnchor(equalTo: view.topAnchor)
            .bottomAnchor(equalTo: view.bottomAnchor)
            .leadingAnchor(equalTo: view.leadingAnchor)
            .trailingAnchor(equalTo: view.trailingAnchor)
        
    }
    
}
