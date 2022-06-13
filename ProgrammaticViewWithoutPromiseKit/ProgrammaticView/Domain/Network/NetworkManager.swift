//
//  NetworkManager.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import SystemConfiguration
import Alamofire
import SwiftyJSON
import MobileCoreServices

// MARK: - TypeAlias for data type
typealias Params = [String: Any]

// MARK: - Completion Block
typealias CompletionNetwork = (_ success: Bool, _ result: JSON) -> Void

class NetworkManager: NSObject {
    
    // MARK: - Shared Variables
    static let shared = NetworkManager()
    private let alamofireManager = AlamofireManager()
    
    // MARK: - Shared methods
    private func addHeaders(_ isAuth: Bool = false, _ isJson: Bool = false) -> (Bool, HTTPHeaders) {
        var header: HTTPHeaders = [:]
        if isAuth {
            header[Utilities.Headers.auth] = ""
        }
        
        header[Utilities.Headers.contentType] = isJson ? Utilities.Headers.JsonEncoded :  Utilities.Headers.FormUrlEncoded
        return (true, header)
    }
    
    private func checkAPIStatus(_ response: AFDataResponse<Data?>) -> Bool {
        if let statusCode = response.response?.statusCode, statusCode == 200 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Request for General Apis
    func request(_ url: String, _ method: HTTPMethod = .get, _ params: Params, isAuthReq: Bool = false, isJosnEncoded: Bool = false, completion: @escaping CompletionNetwork) {
        
        if !Reachability.shared.isReachable {
            let json = JSON(["message": "Internet Required"])
            completion(false, json)
        }
        
        alamofireManager.session.request(url, method: method, parameters: params, encoding: isJosnEncoded ? JSONEncoding.default : URLEncoding.default, headers: addHeaders(isAuthReq, isJosnEncoded).1).validate().response { remoteResponse in
            
            // Manage Response from remote API
            self.manageResponses(remoteResponse) { (success, result) in
                completion(success, result)
            }
        }
    }
    
    private func manageResponses(_ response: AFDataResponse<Data?>, completion: @escaping CompletionNetwork) {
        
        switch response.result {
        case .failure(let error):
            
            // Failure completion block
            let json = JSON(["message": error.localizedDescription])
            completion(false, json)
            
        case .success(let value):
            
            // Success block
            if let data = value {
                let json = JSON(data)
                if checkAPIStatus(response) {
                    completion(true, json)
                } else {
                    completion(false, genericJson())
                }
            } else {
                completion(false, genericJson())
            }
        }
    }
    
    private func genericJson() -> JSON {
        return JSON(["message": "Error! While fetching data"])
    }
}
