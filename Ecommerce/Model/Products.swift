//
//  Photos.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import Foundation



struct Product :Decodable{
    var pricing : Pricing?
    var title : String?
    var desc : String?
    var images : [Images]?
    var id : Int?
    var img : Images?

}

struct Pricing :Decodable{
    var price : Float?
    var savings_text : String?

}
struct Images :Decodable{
    var position:Int?
    var name : String?
}
