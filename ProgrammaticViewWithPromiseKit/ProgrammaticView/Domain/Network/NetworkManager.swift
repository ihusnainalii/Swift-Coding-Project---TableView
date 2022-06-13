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
import PromiseKit
import MobileCoreServices

// MARK: - TypeAlias for data type
typealias Params = [String: Any]

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
    func request(_ url: String, _ method: HTTPMethod = .get, _ params: Params, isAuthReq: Bool = false, isJosnEncoded: Bool = false)  -> Promise<String> {
        return Promise { seal in
            
            if !Reachability.shared.isReachable {
                seal.reject(createError("Internet required"))
            }
            
            alamofireManager.session.request(url, method: method, parameters: params, encoding: isJosnEncoded ? JSONEncoding.default : URLEncoding.default, headers: addHeaders(isAuthReq, isJosnEncoded).1).validate().response { remoteResponse in
                
                // Manage Response from remote API
                switch remoteResponse.result {
                case .failure(let error):
                    
                    // Failure completion block
                    seal.reject(self.createError(error.localizedDescription))
                case .success(let value):
                    
                    // Success block
                    if let data = value {
                        let json = JSON(data)
                        if self.checkAPIStatus(remoteResponse) {
                            seal.fulfill(json["name"].stringValue)
                        } else {
                            seal.reject(self.createError("Parsing Error"))
                        }
                    } else {
                        seal.reject(self.createError("API Fail with error: \(remoteResponse.response?.statusCode ?? 0)"))
                    }
                }
            }
        }
    }
    
    private func createError(_ error: String) -> Error {
        return NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: error])
    }
}
