//
//  AppUtils.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import UIKit

struct Utilities {
    
    // MARK: - Color
    struct Avenir {
        static let Book = "Avenir-Book"
        static let Medium = "Avenir-Medium"
    }
    
    // MARK: - Color
    struct Colors {
        static let AppColor = UIColor(named: "")
    }
    
    // MARK: - Constant
    struct Constants {
        
        // General App Constants
        static let appName = "Tameer.com"
        static let footerSize: CGFloat = 200
        static let success = "Success"
        static let appCornerRadius: CGFloat = 8
        static let firstAction = 0
        
        // General Strings
        static let blankValue = ""
        static let intOValue = 0
    }
    
    // MARK: - Default Key
    struct Defaults {
        static let userData = "userData"
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
        static let appStatus = "appstatus"
        static let userRole = "userRole"
        static let userHome = "userHome"
        static let email = "ahmed@ili.digital"
        static let password = "qwerty123"
        static let faceID = "faceID"
        static let isLogin = "isLogin"
    }
    
    // MARK: - Headers
    struct Headers {
        static let contentType = "Content-Type"
        static let FormUrlEncoded = "application/x-www-form-urlencoded"
        static let JsonEncoded = "application/json"
        static let auth = "Authorization"
        static let authData = "Bearer "
    }
}
