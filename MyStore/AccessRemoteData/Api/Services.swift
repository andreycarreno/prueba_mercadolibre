//
//  Services.swift
//  MyStore
//
//  Created by iMac on 29/03/21.
//

import Foundation

class Services: ServicesToInteractorProtocols {
    
    static var baseUrl: String{
        return "https://api.mercadolibre.com/sites/MLA/"
    }
    
    weak var delegate: InteractorToServicesProtocols?
    
    init(delegate: InteractorToServicesProtocols) {
        self.delegate = delegate
    }
    
    func get(method: ServicesUrlEnum, params: String) {
        
        let paramsEncode = Utils.encodeUrl(url: params)
        let strMethod: String = Utils.getUrlMetod(url: method)
        let url = "\(Services.baseUrl)\(strMethod)\(paramsEncode)"
                
        var request:URLRequest!
        
        guard let serviceUrl = URL(string: url) else { return }
        
        request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        
        session.dataTask(with: request) { [weak self] (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data, options: [])

                    self?.delegate?.susses(result: json as! [String : Any])
                    
                    print(json)
                    
                } catch {
                    
                    self?.delegate?.failed(error: error.localizedDescription)
                    
                }
            }
        }.resume()
        
    }
    

    

}
