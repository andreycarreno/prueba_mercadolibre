//
//  HomeMock.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
@testable import MyStore

class HomeMockView: PresenterToViewHomeProtocol {
    
    var onProductResponseSuccessCalled = false
    var onMovieResponseFailedCalled = false
    
    func onProductResponseSuccess(producList: Array<ProductModel>) {
        
        onProductResponseSuccessCalled = true
        
    }
    
    func onMovieResponseFailed(error: String) {
        
        onMovieResponseFailedCalled = true
        
    }
    
}
