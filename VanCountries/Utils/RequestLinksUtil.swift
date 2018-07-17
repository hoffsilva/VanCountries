//
//  RequestLinks.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

private struct FileName {
    static let requestLink = "RequestLinks"
    static let environmentLink = "EnvironmentLinks"
}

struct RequestLinksUtil {
    
    func allJobs(en: String) -> String {
        return getHost() + getEndpoint(endpointName: en)
    }
    
    private func getHost() -> String {
        return keyManagerFile(key: EnvironmentLinks.shared.current) as String
    }
    
    private func getEndpoint(endpointName: String) -> String {
        return keyManagerFile(key: endpointName )
    }
    
    
    private func keyManagerFile(key:Any) -> String{
        
        if  let key = key as? EnvironmentBase{
            let file = loadFile(fileName: FileName.environmentLink)
            if let host = file.object(forKey: key.rawValue) as? String {
                return host
            }
            
        }
        if  let key = key as? RequestLinks{
            let file = loadFile(fileName: FileName.requestLink)
            if let link = file.object(forKey: key.rawValue) as? String {
                return link
            }
        }
        return ""
    }
    
    private func loadFile(fileName: String) -> NSMutableDictionary {
        return FileManager.load(name: fileName)!
    }
    
}
