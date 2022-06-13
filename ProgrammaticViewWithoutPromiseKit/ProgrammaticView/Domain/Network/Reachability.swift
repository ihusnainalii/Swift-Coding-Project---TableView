//
//  Reachability.swift
//  ProgrammaticView
//
//  Created by Husnain Ali on 13/06/2022.
//

import Foundation
import Network
import SystemConfiguration

class Reachability {
    
    // MARK: - Shared Variables
    static let shared = Reachability()
    
    // MARK: - Variables
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }  // If status is satisfied return true
    var isReachableOnCellular: Bool = true
    
    // MARK: - Custom Functions
    func startMonitoring() {
        
        monitor.pathUpdateHandler = { [weak self] path in
            
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            // Post internet connection
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "checkConnection"), object: nil, userInfo: nil)
            
            // Check Signal Strength
            if path.status == .satisfied {
                
                print("We're connected!")
                // post connected notification
                
                
            } else {
                print("No connection.")
                // post disconnected notification
            }
            
            print(path.isExpensive)
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
