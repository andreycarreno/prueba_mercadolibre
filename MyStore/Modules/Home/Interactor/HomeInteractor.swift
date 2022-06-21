//
//  HomeInteractor.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import Foundation
class HomeInteractor: PresenterToInteractorHomeProtocol{
    
    weak var presenter: InteractorToPresenterHomeProtocol?
    var services: ServicesToInteractorProtocols?
    
    init() {
        services = Services(delegate: self)
    }
    
    func fetchProducts(query: String) {
        
        services?.get(method: .get(urlGet: .search), params: query)
        
    }
        
}
extension HomeInteractor: InteractorToServicesProtocols{
    
    func susses(result: [String : Any]) {
        
        let result = try! DictionaryDecoder().decode(ResultModel.self, from: (result) )
        
        self.presenter?.productFetchSuccess(producList: result.results ?? [])
       
    }
    
    func failed(error: String) {
        
        presenter?.productFetchFailed(error: error)
        
    }
    
    
}
    
    
    
    

