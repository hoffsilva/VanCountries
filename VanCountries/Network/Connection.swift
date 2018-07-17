//
//  Connection.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

class Connection {
    static func fetchData(url: String, responseData: @escaping (Data) -> Swift.Void){
        
        if !verifyConnection() {
            let alert = UIAlertController()
            alert.title = "Internet Error"
            alert.message = "The internet connection has some problem"
            let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(action)
            DispatchQueue.main.async {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }
            return
        }
        
        let stringURL = url
    
        let url = URL(string: stringURL.trimmingCharacters(in: .whitespaces))
        
        guard let URL = url else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: URL) { (data, response, error) in
            responseData(data!)
        }
        
    }
    
    static func verifyConnection() -> Bool {
        
        let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
        
    }
}
