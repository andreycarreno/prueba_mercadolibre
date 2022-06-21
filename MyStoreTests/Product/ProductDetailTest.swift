//
//  ProductDetailTest.swift
//  MyStoreTests
//
//  Created by iMac on 29/03/21.
//

import XCTest
@testable import MyStore

class ProductDetailPresenterTests: XCTestCase {

    var mockView: ProductDetailMockView!
    var mockRouter: ProductDetailMockRouter!
    var mockInteractor: ProductDetailInteractor!
    var sut: ProductDetailPresenter!
    
    override func setUp(){
        super.setUp()
        mockView = ProductDetailMockView()
        mockRouter = ProductDetailMockRouter()
        mockInteractor = ProductDetailInteractor()
        sut = ProductDetailPresenter()
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
    
    func test_getProductDetail(){
        //Given
        
        //When
        sut.getProductDetail()
        //Then
        XCTAssertTrue(mockView.getProductCalled)
    }
    
    func test_getRowsTable(){
        //Given
        
        //When
        sut.getRowsTable()
        //Then
        XCTAssertTrue(mockView.getDataTableCalled)
    }
    
}


