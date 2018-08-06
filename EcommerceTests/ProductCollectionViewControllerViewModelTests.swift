//
//  ProductCollectionViewControllerViewModelTests.swift
//  EcommerceTests
//
//  Created by user on 05/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import Ecommerce

class MockProductCollectionRequestUseCase: ProductCollectionRequestUseCase {
    override func initialize(requestDTO: ProductRequestDTO, completionHandler: @escaping (ProductResponseDTO?, Error?) -> Void) {
        
        let dto = ProductResponseDTO(products: [Product(pricing: nil, title: nil, desc: nil, images: nil, id: nil, img: nil)], status: Status(code: 404, msg: "No Data Found"), url: nil)
        completionHandler(dto,nil);
    }
    
    
}

class ProductCollectionViewControllerViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    func testProductCollectionViewControllerViewModel() {
        let viewModel =  ProductCollectionViewModel()
        let useCase = MockProductCollectionRequestUseCase()
        viewModel.getProductInfoFromStarting(completionHandler: { (message) in
            if message != nil{
                //show Alert
                XCTFail(message!)
            }else {
                XCTAssertTrue(true)
            }
        } , useCase : useCase)
    }
    func testGetNextPaginationProducts() {
        let viewModel =  ProductCollectionViewModel()
        let useCase = MockProductCollectionRequestUseCase()
        
        viewModel.getNextProductInfo(completionHandler: { (message) in
            if message != nil{
                //show Alert
                XCTFail(message!)
            }else {
                XCTAssertTrue(true)
            }
        } , useCase : useCase)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
