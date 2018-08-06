//
//  NetworkManagerTests.swift
//  EcommerceTests
//
//  Created by user on 05/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import Ecommerce

class NetworkManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAsyncCalback() {
        let pageSize = 30
        let pageNo = 0
        var requestUseCase :ProductCollectionRequestUseCase?
        
        let requestDTO = ProductRequestDTO(pageSize: pageSize, page: pageNo)
        requestUseCase = ProductCollectionRequestUseCase()
        requestUseCase?.initialize(requestDTO: requestDTO, completionHandler: { (responseDTO, error) in
            if(error != nil)
            {
                XCTFail(error.debugDescription)
            }else
            {
                if responseDTO?.status?.code == 404{
                    XCTFail()
                }else {
                    XCTAssertTrue(true)
                }
            }
        })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
