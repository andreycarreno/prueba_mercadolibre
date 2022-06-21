//
//  SeekerPresenterTest.swift
//  MyStoreTests
//
//  Created by iMac on 29/03/21.
//

import XCTest
@testable import MyStore

class SeekerPresenterTests: XCTestCase {

    var mockView: SeekerMockView!
    var mockRouter: SeekerMockRouter!
    var mockInteractor: SeekerMockInteractor!
    var sut: SeekerPresenter!
    
    override func setUp(){
        super.setUp()
        mockView = SeekerMockView()
        mockRouter = SeekerMockRouter()
        mockInteractor = SeekerMockInteractor()
        sut = SeekerPresenter()
        sut.view = mockView
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }
    
    override func tearDown() {
        super.tearDown()
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        sut = nil
    }
    
    func test_validateQuery(){
        //Given
        
        //When
        sut.validateQuery(text: "")
        //Then
        XCTAssertTrue(mockView.validateQueryCalled)
    }
    
    func test_goToHome(){
        //Given
        
        //When
        sut.goToHome(query: "", view: HomeViewController())
        //Then
        XCTAssertTrue(mockRouter.disapearToHomeCalled)
        
    }
    
}

