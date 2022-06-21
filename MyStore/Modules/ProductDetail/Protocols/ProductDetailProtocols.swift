//
//  ProductDetailProtocols.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation

protocol ViewToPresenterProductDetailProtocol : AnyObject {
    
    var view: PresenterToViewProductDetailProtocol? {get set}
    var interactor: PresenterToInteractorProductDetailProtocol? {get set}
    var router: PresenterToRouterProductDetailProtocol? {get set}
    var product: ProductModel? {get set}
    
    func getProductDetail()
    func getRowsTable()
}

protocol PresenterToViewProductDetailProtocol: AnyObject {
    
    func getProduct(product: ProductModel?)
    func getDataTable(container: [ProductDetailCellModel])
}

protocol PresenterToRouterProductDetailProtocol: AnyObject {
    
    static func createModule(product: ProductModel)->ProductDetailViewController
    
}

protocol PresenterToInteractorProductDetailProtocol: AnyObject {
    
    var presenter:InteractorToPresenterProductDetailProtocol? {get set}
    
    
}

protocol InteractorToPresenterProductDetailProtocol: AnyObject {
    
}
