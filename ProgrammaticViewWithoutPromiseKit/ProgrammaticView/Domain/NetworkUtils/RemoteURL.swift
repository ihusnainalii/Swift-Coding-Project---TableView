//
//  RemoteURL.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation

class RemoteURL {
    
    // MARK: - Public variables
    var requestedURL: String?
    
    // MARK: - Private variables
    private var api = "api/"
    
    // MARK: - Required init
    required init(with uri: String) {
        let configurators = AppConfiguration()
        requestedURL = configurators.apiBaseURL + api + uri
    }
}
