//
//  MainRepository.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import PromiseKit

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
    
        // Promise Call
        firstly {
            Request<String>.fetchNameRequest(url: url, endPoint: endPoint)
        }
        .done {
            completion(true, "Data Fetched", $0)
        }
        .catch { error in
            completion(false, error.localizedDescription, nil)
        }
        .finally {
            print("finally")
        }
    }
}


struct Request<T: Decodable> {
    static func fetchNameRequest(url: String, endPoint: EndPointEnum) -> Promise<String> {
        // Request
        let task = NetworkManager()
        return task.request(url, endPoint.httpMethod, [:], isAuthReq: endPoint.isAuthRequired, isJosnEncoded: endPoint.isJSONEncoded)
    }
}
