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
    
    static let shared = Service()
    
    static var allJobs: String {
        return FileManager.load(name: FileName.environmentLink)
    }
    
    
    
    
    private func getHost() -> String {
        let file = loadFile(fileName: FileName.environmentLink)
        if let host = file?.object(forKey: EnvironmentLinks.shared.current) as? String {
            return host
        }
    }
    
    private func getEndpoint(endpointName: String) -> String {
        
    }
    
    
    private func loadFile(fileName: String) -> NSMutableDictionary {
        return FileManager.load(name: fileName)
    }
    
}
