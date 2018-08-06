//
//  ProductCollectionViewCell.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell , ReuseIdentifier ,NibLoadableView{

    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!

    var sessionTask : URLSessionTask?
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    func updateInterface(title:String?,price : Float? , discount :String?){
        titleLabel.text = title
        if let price = price {
            priceLabel.text = price.toPrice
        }else {
            priceLabel.text = nil
        }
        discountLabel.text = discount
    }
}

