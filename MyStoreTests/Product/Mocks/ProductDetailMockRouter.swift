//
//  ProductDetailMockInteractor.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
@testable import MyStore

class ProductDetailMockRouter: PresenterToRouterProductDetailProtocol {
    
    var createModuleCalled = false
    
    static func createModule(product: ProductModel) -> ProductDetailViewController {
        
        ProductDetailViewController()
        
    }
    
}
