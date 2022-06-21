//
//  HomeInteractorTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import XCTest
@testable import MyStore

class HomeInteractorTests: XCTestCase {
    
    var mockPresenter: MockPresenter!
    var sut: HomeInteractor!
    
    override func setUp(){
        super.setUp()
        mockPresenter = MockPresenter()
        sut = HomeInteractor()
        
        sut.presenter = mockPresenter
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockPresenter = nil
        sut = nil
        
    }
    
    func test_fetchProducts(){
        //Given
        mockPresenter.expectation = expectation(description: #function)
        //When
        sut.fetchProducts(query: "")
        //Then
        wait(for: [mockPresenter.expectation], timeout: 6)
        XCTAssertTrue(mockPresenter.productFetchSuccessCalled)
        
    }
    
    func test_fetchProductsFailed(){
        //Given
        mockPresenter.expectation = expectation(description: #function)
        //When
        sut.fetchProducts(query: "")
        //Then
        wait(for: [mockPresenter.expectation], timeout: 6)
        XCTAssertTrue(mockPresenter.productFetchSuccessCalled)
        
    }
    
    class MockPresenter: InteractorToPresenterHomeProtocol {
        
        var productFetchSuccessCalled = false
        var productFetchFailedCalled = false
        var expectation: XCTestExpectation!
        
        
        func productFetchSuccess(producList: Array<ProductModel>) {
            
            productFetchSuccessCalled = true
            expectation.fulfill()
        }
        
        func productFetchFailed(error: String) {
            
            productFetchFailedCalled = true
            expectation.fulfill()
            
        }
        
    }
    
    
}
