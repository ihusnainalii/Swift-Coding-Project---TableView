//
//  ResponseStrings.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation

enum APIKEYS: String {
    case NAME = "name"
}

class KEY {
    // MARK: - Get Response
    class func get(_ type: APIKEYS) -> String {
        return type.rawValue
    }
}
