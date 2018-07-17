//
//  RequestLinks.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 17/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

private struct FileName {
    static let requestLink = "RequestURLS"
    static let environmentLink = "EnvironmentURLS"
}

struct RequestLinksUtil {
    
    func getData(en: String) -> String {
        return getHost() + getEndpoint(endpointName: en)
    }
    
    private func getHost() -> String {
        guard let file = EnvironmentLinks.shared.current else {
            return ""
        }
        return keyManagerFile(key: file) as String
    }
    
    private func getEndpoint(endpointName: String) -> String {
        RequestLinks.shared.current = RequestLinksBase(rawValue: endpointName)
        guard let file = RequestLinks.shared.current else {
            return ""
        }
        return keyManagerFile(key: file) as String
    }
    
    
    private func keyManagerFile(key:Any) -> String{
        
        if  let key = key as? EnvironmentBase {
            let file = loadFile(fileName: FileName.environmentLink)
            if let host = file.object(forKey: key.rawValue) as? String {
                return host
            }
            
        }
        if  let key = key as? RequestLinksBase {
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
