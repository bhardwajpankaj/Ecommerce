//
//  Constants.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//
import UIKit

struct Constants {
    
    // Product image url Prefix
    static let urlPrefix = "http://media.redmart.com/newmedia/200p"
    
    // Home page config
    static let NumberOfColumns = 2 // Change for number of tiles per row
    static let marginAround = 8 // Margin to Tiles/Cell for Home page
    static let homePageUrl = "https://api.redmart.com/v1.6.0/catalog/search?theme=all-sales"
    static let cellHeight = 240
    
    // App colors
    static let appBackgroundColor = UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1) // Light Gray
    static let statusBarColor = UIColor(red: 236.0/255.0, green: 32.0/255.0, blue: 96.0/255.0, alpha: 1) // Light Gray
}
