//
//  HomeProtocols.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import Foundation
import UIKit

protocol ViewToPresenterHomeProtocol : AnyObject {
    
    var view: PresenterToViewHomeProtocol? {get set}
    var interactor: PresenterToInteractorHomeProtocol? {get set}
    var router: PresenterToRouterHomeProtocol? {get set}
    func startFetchingProducts(query: String)
    func openSeeker(navigationController: UINavigationController)
    func showProducDetail(product: ProductModel, navigation: UINavigationController)
    
}

protocol PresenterToViewHomeProtocol: AnyObject {
    
    func onProductResponseSuccess(producList: Array<ProductModel>)
    func onMovieResponseFailed(error: String)
    
}

protocol PresenterToRouterHomeProtocol: AnyObject {
    
    static func createModule()->HomeViewController
    func openSeeker(delegate: HomePresenter, navigationController: UINavigationController)
    func pushProductDetail(product: ProductModel, navigationController: UINavigationController)
    
}

protocol PresenterToInteractorHomeProtocol: AnyObject {
    
    var presenter:InteractorToPresenterHomeProtocol? {get set}
    func fetchProducts(query: String)
    
}

protocol InteractorToPresenterHomeProtocol: AnyObject {
    
    func productFetchSuccess(producList: Array<ProductModel>)
    func productFetchFailed(error: String)
    
}
