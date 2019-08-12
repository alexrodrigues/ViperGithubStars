//
//  HomeProtocols.swift
//  ViperGithub
//
//  Created Alex Rodrigues on 08/08/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Router

protocol HomeWireframeProtocol: class {

}

// MARK: - Interactor

protocol HomeInteractorInputProtocol {
    func fetch()
}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {
    func didFetchedRepos(repos: [Repo])
    func didFailedRequest(with error: MyError)
}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    func setupViewCoding()
    func didFetchedRepos(repos: [Repo])
    func failedFetchRepos(message: String)
}

// MARK: - Analytics

protocol HomeAnalyticsProtocol: class {

}
