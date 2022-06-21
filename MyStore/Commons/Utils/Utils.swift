//
//  Utils.swift
//  MyStore
//
//  Created by iMac on 29/03/21.
//

import Foundation
class Utils {
    
    static func encodeUrl(url: String) -> String{
        
        return url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
    }
    
    static func getUrlMetod(url: ServicesUrlEnum) -> String{
        
        var urlStr: String = ""
        
        switch url {
        case .get(urlGet: let method):
            urlStr = method.rawValue
        }
        
        return urlStr
    }
}
