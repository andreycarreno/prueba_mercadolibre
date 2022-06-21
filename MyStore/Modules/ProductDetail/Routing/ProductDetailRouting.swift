//
//  ProductDetailRouting.swift
//  MyStore
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
import UIKit

class ProductDetailRouter: PresenterToRouterProductDetailProtocol{
    /// this var get the  product detail storyboard 
    static var storyboard: UIStoryboard{
        return UIStoryboard(name:"ProductDetail", bundle: Bundle.main)
    }
    /** instantiate the product detail module*/
    static func createModule(product: ProductModel) -> ProductDetailViewController {
        
        let view = ProductDetailRouter.storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        
        let presenter: ViewToPresenterProductDetailProtocol & InteractorToPresenterProductDetailProtocol = ProductDetailPresenter()
        let interactor: PresenterToInteractorProductDetailProtocol = ProductDetailInteractor()
        let router: PresenterToRouterProductDetailProtocol = ProductDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.product = product
        interactor.presenter = presenter
        
        return view
        
    }
    
    
    
}
