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
    
}

// MARK: - View Coding

extension HomeView {
    
    func configureViews() {
        activityIndicatorView.startAnimating()
    }
    
    func setupViewHierarchy() {
        view.addSubview(activityIndicatorView)
    }
    
    func setupConstraints() {
        
        activityIndicatorView
            .centerXAnchor(equalTo: view.centerXAnchor)
            .centerYAnchor(equalTo: view.centerYAnchor)
        
    }
    
}
