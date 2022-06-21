//
//  ResultModel.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import Foundation
struct ResultModel: Codable {
    
    var site_id: String?
    var query: String?
    var results: [ProductModel]?
    
}
