//
//  HomeInteractor.swift
//  ViperGithub
//
//  Created Alex Rodrigues on 08/08/19.
//  Copyright © 2019. All rights reserved.
//

import UIKit

class HomeInteractor: NSObject {

	// MARK: - Viper Module Properties

    weak var output: HomeInteractorOutputProtocol?

    // MARK: - Private Methods

}

// MARK: - HomeInteractorInputProtocol

extension HomeInteractor: HomeInteractorInputProtocol {

    func fetch() {
        Api<GithubResponse>()
            .request(with: .home, method: .get) { [weak self] result in
                switch result {
                    case .success(let repos):
                    self?.output?.didFetchedRepos(repos: repos.items ?? [Repo]())
                    case .error(let error):
                    self?.output?.didFailedRequest(with: error)
                }
            }
    }

}
