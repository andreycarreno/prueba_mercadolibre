//
//  SeekerMockRouter.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import UIKit
@testable import MyStore

class SeekerMockRouter: PresenterToRouterSeekerProtocol{
    
    var createModuleCalled = false
    var disapearToHomeCalled = false
    
    static func createModule(delegate: PresenterToPresenterSeekerProtocol) -> SeekerViewController {
        
        SeekerViewController()
        //createModuleCalled = true
    }
    
    func disapearToHome(query: String, view: UIViewController) {
        
        disapearToHomeCalled = true
        
    }
    
    
}
