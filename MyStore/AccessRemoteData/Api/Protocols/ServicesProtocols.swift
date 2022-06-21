//
//  ServicesProtocols.swift
//  MyStore
//
//  Created by iMac on 29/03/21.
//

import Foundation
protocol InteractorToServicesProtocols : AnyObject{
    
    func susses(result: [String:Any])
    func failed(error: String)
    
}

protocol ServicesToInteractorProtocols: AnyObject{
    
    func get(method: ServicesUrlEnum, params: String)
    
}
