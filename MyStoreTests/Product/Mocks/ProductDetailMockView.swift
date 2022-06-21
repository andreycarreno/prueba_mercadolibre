//
//  ProductDetailMockView.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
@testable import MyStore

class ProductDetailMockView: PresenterToViewProductDetailProtocol {
    
    var getProductCalled = false
    var getDataTableCalled = false
    
    func getProduct(product: ProductModel?) {
        
        getProductCalled = true
        
    }
    
    func getDataTable(container: [ProductDetailCellModel]) {
        
        getDataTableCalled = true
        
    }
    
    
}
