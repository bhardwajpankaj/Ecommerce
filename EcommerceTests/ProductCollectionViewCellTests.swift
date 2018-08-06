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
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: ProductCollectionViewCell.self)
        guard let cell = bundle.loadNibNamed("ProductCollectionViewCell", owner: nil)?.first as? ProductCollectionViewCell else {
            return XCTFail()
        }
        cell.prepareForReuse()
        cell.updateInterface(title: "Ball", price: 5.0, discount: "5 % Off")
        XCTAssertEqual(cell.titleLabel.text!, "Ball")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func tessutIniatedata() {
        

    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
