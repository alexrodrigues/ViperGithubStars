//
//  HomePresenter.swift
//  ViperGithub
//
//  Created Alex Rodrigues on 08/08/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class HomePresenter: NSObject {

	// MARK: - Viper Module Properties
    weak var view: HomePresenterOutputProtocol!
    var interactor: HomeInteractorInputProtocol!
    var wireframe: HomeWireframeProtocol!

	// MARK: - Private Methods

}

// MARK: - HomePresenterInputProtocol

extension HomePresenter: HomePresenterInputProtocol {
    
    func viewDidLoad() {
        view.setupViewCoding()
        interactor.fetch()
    }
    
}

// MARK: - HomePresenterInteractorOutputProtocol

extension HomePresenter: HomeInteractorOutputProtocol {

    func didFetchedRepos(repos: [Repo]) {
        view.didFetchedRepos(repos: repos)
    }

    func didFailedRequest(with error: MyError) {
        view.failedFetchRepos(message: error.localizedDescription)
    }
}
