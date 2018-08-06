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
            let numberOfColumns = Constants.NumberOfColumns
            let itemWidth = (Int(self.collectionView!.bounds.width) - (numberOfColumns - 1)) / numberOfColumns
            let marginToWidth = ((itemWidth * numberOfColumns) + (Constants.marginAround * 2)) - Int(self.collectionView!.bounds.width)
            return CGSize(width: itemWidth - marginToWidth, height: Constants.cellHeight)
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


