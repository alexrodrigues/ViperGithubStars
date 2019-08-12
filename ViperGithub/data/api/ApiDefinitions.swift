//
//  ApiDefinitions.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 26/03/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import Foundation

struct ApiDefinitions {
    
    // MARK: - The BASE URL
    
    // MARK: - Possible Endpoints
    
    enum Endpoint: String {
        case home = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    }
    
    // MARK: - Possible Http Methods
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}
