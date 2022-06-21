//
//  HomeMockInteractor.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
@testable import MyStore

class HomeMockInteractor: PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol?
    var fetchProductsCalled = false
    
    func fetchProducts(query: String) {
        
        fetchProductsCalled = true
    }
    
}
