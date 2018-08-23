//
//  CustomImageFlowLayout.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class CustomImageFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
        }
        get {
            // Finding cell size according to the margins
            let numberOfColumns = Constants.NumberOfColumns
            let itemWidth = ((CGFloat(self.collectionView!.bounds.width)) / CGFloat(numberOfColumns))
            let itWidth = itemWidth - CGFloat((Constants.marginAround * (numberOfColumns + 1))/numberOfColumns)
            return CGSize(width: itWidth, height: CGFloat(Constants.cellHeight))
        }
    }
    private func setupLayout() {
        let margin:CGFloat = CGFloat(Float(Constants.marginAround))
        minimumInteritemSpacing = margin
        minimumLineSpacing = margin
        scrollDirection = .vertical
        sectionInset.top = margin
        sectionInset.left = margin
        sectionInset.right = margin
    }
    
}


