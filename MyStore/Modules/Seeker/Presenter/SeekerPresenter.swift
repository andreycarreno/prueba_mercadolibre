//
//  SeekerPresenter.swift
//  MyStore
//
//  Created by iMac on 27/03/21.
//

import Foundation
import UIKit

class SeekerPresenter: ViewToPresenterSeekerProtocol{
    // var is later use for pass data whe dissmiss view/
    var delegate: PresenterToPresenterSeekerProtocol?
    
    var view: PresenterToViewSeekerProtocol?
    
    var interactor: PresenterToInteractorSeekerProtocol?
    
    var router: PresenterToRouterSeekerProtocol?
    
    /**
     this function validate text query
     :params: text - query words
     */
    func validateQuery(text: String) {
        
        view?.validateQuery(isValid: (text != "" ? true : false))
        
    }
    /** this function dissmiss the popUp secker and pass text query to the home view presenter*/
    func goToHome(query: String, view: UIViewController) {
        
        router?.disapearToHome(query: query, view: view)
        delegate?.dissmiss(query: query)
    }
    
}

extension SeekerPresenter: InteractorToPresenterSeekerProtocol{
    
    
}
