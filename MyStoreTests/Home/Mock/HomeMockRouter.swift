//
//  HomeMockPresenter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import Foundation
import UIKit
@testable import MyStore

class HomeMockRouter: PresenterToRouterHomeProtocol{
    
    var openSeekerCalled = false
    var pushProductDetailCalled = false
    
    static func createModule() -> HomeViewController {
        return HomeViewController()
    }
    
    func openSeeker(delegate: HomePresenter, navigationController: UINavigationController) {
        
        openSeekerCalled = true
        
    }
    
    func pushProductDetail(product: ProductModel, navigationController: UINavigationController) {
        
        pushProductDetailCalled = true
        
    }
    
    
}
