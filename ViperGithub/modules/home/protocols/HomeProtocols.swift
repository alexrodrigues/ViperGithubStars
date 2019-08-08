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

}

// MARK: - Presenter

protocol HomePresenterInputProtocol: class {
    func viewDidLoad()
}

protocol HomeInteractorOutputProtocol: class {

}

// MARK: - View

protocol HomePresenterOutputProtocol: class {
    func setupViewCoding()
}

// MARK: - Analytics

protocol HomeAnalyticsProtocol: class {

}
