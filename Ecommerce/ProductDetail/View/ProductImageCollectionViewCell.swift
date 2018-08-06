//
//  ProductImageCollectionViewCell.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell, ReuseIdentifier ,NibLoadableView {

    @IBOutlet weak var productImageView: UIImageView!
    var sessionTask : URLSessionTask?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
}
