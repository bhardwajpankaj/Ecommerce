//
//  ProductCollectionViewControllerTests.swift
//  EcommerceTests
//
//  Created by user on 05/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import XCTest
@testable import Ecommerce

class ProductCollectionViewControllerTests: XCTestCase {
    
    var productCollectionViewController: ProductCollectionViewController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        productCollectionViewController = navigationController.topViewController as! ProductCollectionViewController

        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(productCollectionViewController.view)

    }
    
    override func tearDown() {
        productCollectionViewController = nil
        super.tearDown()
    }
    
    func testSUT_CanInstantiateViewController() {
        
        XCTAssertNotNil(productCollectionViewController)
    }
    
    func testSUT_CollectionViewIsNotNilAfterViewDidLoad() {
        
        XCTAssertNotNil(productCollectionViewController.collectionView)
    }
    
    func testSUT_HasItemsForCollectionView() {
        
        XCTAssertNotNil(productCollectionViewController.viewModel)
    }
    
    func testSUT_ShouldSetCollectionViewDataSource() {
        
        XCTAssertNotNil(productCollectionViewController.collectionView.dataSource)
    }
    
    func testSUT_ConformsToCollectionViewDataSource() {
        
        XCTAssert(productCollectionViewController.responds(to: #selector(productCollectionViewController.collectionView(_:cellForItemAt:))))
        XCTAssert(productCollectionViewController.responds(to: #selector(productCollectionViewController.collectionView(_:numberOfItemsInSection:))))
      
    }
    func testSUT_ConformsToCollectionViewDelegate() {
        
        XCTAssert(productCollectionViewController.responds(to: #selector(productCollectionViewController.collectionView(_:didSelectItemAt:))))
        
    }
    
    func testSUT_ShouldSetCollectionViewDelegate() {
        
        XCTAssertNotNil(productCollectionViewController.collectionView.delegate)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
