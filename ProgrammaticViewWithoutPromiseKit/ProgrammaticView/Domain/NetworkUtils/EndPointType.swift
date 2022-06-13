//
//  EndPointType.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Alamofire

protocol EndPointType {
    var url: String? { get }
    var httpMethod: HTTPMethod { get }
    var isAuthRequired: Bool { get }
    var isJSONEncoded: Bool { get }
}
