//
//  ServicesUrl.swift
//  MyStore
//
//  Created by iMac on 29/03/21.
//

import Foundation
enum ServicesUrlEnum {
    case get(urlGet:GetUrls)
}
enum GetUrls: String{
    case search = "search?"
}
