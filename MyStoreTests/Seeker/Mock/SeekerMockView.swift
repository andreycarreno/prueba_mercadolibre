//
//  SeekerViewMock.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

@testable import MyStore

class SeekerMockView: PresenterToViewSeekerProtocol {
    
    var validateQueryCalled = false
    
    func validateQuery(isValid: Bool) {
        validateQueryCalled = true
    }
    
    
}
