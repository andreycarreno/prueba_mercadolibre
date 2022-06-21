//
//  HomePresenterTest.swift
//  MyStoreTests
//
//  Created by Andrey Carreño on 20/06/22.
//

import XCTest
@testable import MyStore

class HomePresenterTests: XCTestCase {

    var mockView: HomeMockView!
    var mockRouter: HomeMockRouter!
    var mockInteractor: HomeMockInteractor!
    var sut: HomePresenter!
    
    override func setUp(){
        super.setUp()
        mockView = HomeMockView()
        mockRouter = HomeMockRouter()
        mockInteractor = HomeMockInteractor()
        sut = HomePresenter()
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
    
    func test_startFetchingProducts(){
        //Given
        
        //When
        sut.startFetchingProducts(query: "")
        //Then
        XCTAssertTrue(mockInteractor.fetchProductsCalled)
    }
    
    func test_onProductResponseSuccess(){
        //Given
        
        //When
        sut.onProductResponseSuccess(producList: [])
        //Then
        XCTAssertTrue(mockView.onProductResponseSuccessCalled)
    }
    
    func test_openSeeker(){
        //Given
        
        //When
        sut.openSeeker(navigationController: UINavigationController())
        //Then
        XCTAssertTrue(mockRouter.openSeekerCalled)
    }
    
    func test_showProducDetail(){
        //Given
        
        //When
        sut.showProducDetail(product:DummyData.product, navigation: UINavigationController())
        //Then
        XCTAssertTrue(mockRouter.pushProductDetailCalled)
    }
    
    struct DummyData {
        static let product = ProductModel(id: nil, site_id: nil, title: nil, price: nil, sale_price: nil, currency_id: nil, available_quantity: nil, sold_quantity: nil, buying_mode: nil, listing_type_id: nil, stop_time: nil, condition: nil, permalink: nil, thumbnail: nil, thumbnail_id: nil, accepts_mercadopago: nil, attributes: [], original_price: nil, category_id: nil, official_store_id: nil, domain_id: nil, catalog_product_id: nil, tags: nil, catalog_listing: nil, use_thumbnail_id: nil, order_backend: nil)
    }
    
    
}

