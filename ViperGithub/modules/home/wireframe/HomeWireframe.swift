//
//  HomeWireframe.swift
//  ViperGithub
//
//  Created Alex Rodrigues on 08/08/19.
//  Copyright © 2019 XPInvestimentos. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {

	// MARK: - Constants
	private let storyBoardName = "Home"
	
	// MARK: - Viper Module Properties
    var view: HomeView!

	// MARK: - Constructors

	override init() {
		super.init()

		let view = HomeView()
		let interactor = HomeInteractor()
		let presenter = HomePresenter()

		presenter.interactor = interactor
		presenter.wireframe = self
		presenter.view = view

		view.presenter = presenter
		interactor.output = presenter

		self.view = view
        self.view.title = "Viper GithubStars"
	}

    // MARK: - HomeWireframeProtocol

	// MARK: - Private methods

}
