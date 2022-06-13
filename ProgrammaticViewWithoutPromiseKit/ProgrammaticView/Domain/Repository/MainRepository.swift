//
//  MainRepository.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


typealias GenericCompletion<Model> = (_ success: Bool, _ message: String, _ model: Model?) -> Void

final class MainRepository {
    
    /// Fetche name from remote API
    /// - Parameter  completion: A comletion handler for success,
    func fetchName(at index: Int, completion: @escaping GenericCompletion<String>) {
        
        // Request Intercepter
        let endPoint = EndPointEnum.FetchName
        
        // Check if url is not nil
        guard var url = endPoint.url else {
            return completion(false, "PLEASE PROVIDE URL", nil)
        }
        
        url += "?index=\(index)"
        
        NetworkManager.shared.request(url, endPoint.httpMethod, [:], isAuthReq: endPoint.isAuthRequired, isJosnEncoded: endPoint.isJSONEncoded) { success, response in
            if success {
                let name = response[KEY.get(.NAME)].stringValue
                completion(true, "Data Fetched", name)
            } else {
                // Completion
                completion(false, response["message"].stringValue, nil)
            }
        }
    }
}
