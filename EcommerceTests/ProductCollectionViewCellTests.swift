//
//  ProductCollectionViewCellTests.swift
//  EcommerceTests
//
//  Created by user on 05/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import Ecommerce

class ProductCollectionViewCellTests: XCTestCase {
    
    private var sut: ProductCollectionViewCell?

    override func setUp() {
        super.setUp()
        let bundle = Bundle(identifier: "ProductCollectionViewCell")
        let nib = bundle?.loadNibNamed("ProductCollectionViewCell", owner: nil, options: nil)
        sut = nib?.first as? ProductCollectionViewCell
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func tessutIniatedata() {
        sut?.updateInterface(title: "Ball", price: 5.0, discount: "5 % Off")
        
        XCTAssertEqual(sut?.titleLabel.text!, "Ball")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
