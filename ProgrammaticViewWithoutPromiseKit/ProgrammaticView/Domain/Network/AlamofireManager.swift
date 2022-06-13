//
//  AlamofireManager.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Alamofire

struct AlamofireManager {
    
    // MARK: - interceptors
    
    // MARK: - logger
    let monitors = [AlamofireLogger()] as [EventMonitor]
    
    // MARK: - session
    var session = Session()
    
    init() {
        session = Session(
            eventMonitors: monitors
        )
    }
}
