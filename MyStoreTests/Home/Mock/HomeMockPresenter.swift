//
//  HomeMockPresenter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
@testable import MyStore
import XCTest

class HomeMockPresenter: InteractorToPresenterHomeProtocol {
    
    var productFetchSuccessCalled = false
    var productFetchFailedCalled = false
    var expectation: XCTestExpectation!
    
    
    func productFetchSuccess(producList: Array<ProductModel>) {
        
        productFetchSuccessCalled = true
        expectation.fulfill()
    }
    
    func productFetchFailed(error: String) {
        
        productFetchFailedCalled = true
        expectation.fulfill()
        
    }
    
}
