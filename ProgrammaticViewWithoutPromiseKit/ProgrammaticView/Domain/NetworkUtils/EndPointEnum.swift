//
//  EndPointEnum.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Alamofire

enum EndPointEnum {
    
    case FetchName
}

extension EndPointEnum: EndPointType {
    
    var url: String? {
        switch self {
        case .FetchName:
            return EndPoints.fetchNameAtIndex
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .FetchName:
            return .get
        }
    }
    
    var isAuthRequired: Bool {
        switch self {
        case .FetchName:
            return false
        }
    }
    
    var isJSONEncoded: Bool {
        switch self {
        case .FetchName:
            return false
        }
    }
}
