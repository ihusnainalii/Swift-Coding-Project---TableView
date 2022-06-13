//
//  AlamofireLogger.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Alamofire

struct AlamofireLogger: EventMonitor {
    
    let queue = DispatchQueue(label: "BaseLogger")
    
    func requestDidResume(_ request: Request) {
        debugPrint(request)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint(response)
    }
}
