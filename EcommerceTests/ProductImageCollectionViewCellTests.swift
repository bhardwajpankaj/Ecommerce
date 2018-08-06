//
//  ProductImageCollectionViewCellTests.swift
//  EcommerceTests
//
//  Created by user on 06/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest

@testable import Ecommerce

class ProductImageCollectionViewCellTests: XCTestCase {
    
    private var productImageCollectionViewCellSUT: ProductImageCollectionViewCell?

    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: ProductImageCollectionViewCell.self)
        guard let cell = bundle.loadNibNamed("ProductImageCollectionViewCell", owner: nil)?.first as? ProductImageCollectionViewCell else {
            return XCTFail()
        }
        productImageCollectionViewCellSUT = cell
    }
    
    override func tearDown() {
        productImageCollectionViewCellSUT = nil
        super.tearDown()
    }
   

    func testExample() {
        productImageCollectionViewCellSUT?.prepareForReuse()
        productImageCollectionViewCellSUT?.productImageView.image = #imageLiteral(resourceName: "placeholder")
        XCTAssertEqual(productImageCollectionViewCellSUT?.productImageView.image, #imageLiteral(resourceName: "placeholder"))

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
