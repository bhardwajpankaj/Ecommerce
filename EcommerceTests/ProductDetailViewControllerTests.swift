//
//  ProductDetailViewControllerTests.swift
//  EcommerceTests
//
//  Created by user on 05/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import Ecommerce

class ProductDetailViewControllerTests: XCTestCase {
    
    var productDetailViewController: ProductDetailViewController!
    
    override func setUp() {
        
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller:ProductDetailViewController? = storyboard.instantiateVC()

        productDetailViewController = controller
        XCTAssertNotNil(productDetailViewController.view)
    }
    
    override func tearDown() {
        productDetailViewController = nil
        super.tearDown()
    }
    
    func testSUT_CanInstantiateViewController() {
        
        XCTAssertNotNil(productDetailViewController)
    }
    
    func testSUT_CollectionViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(productDetailViewController.imageCollectionView)
    }
    
    
    
    func testSUT_ShouldSetCollectionViewDataSource() {
        
        XCTAssertNotNil(productDetailViewController.imageCollectionView.dataSource)
    }
    
    func testSUT_ConformsToCollectionViewDataSource() {
        
        XCTAssert(productDetailViewController.responds(to: #selector(productDetailViewController.collectionView(_:cellForItemAt:))))
        XCTAssert(productDetailViewController.responds(to: #selector(productDetailViewController.collectionView(_:numberOfItemsInSection:))))
        
    }
    

    func testSUT_ShouldSetCollectionViewDelegate() {
        
        XCTAssertNotNil(productDetailViewController.imageCollectionView.delegate)
    }
}
