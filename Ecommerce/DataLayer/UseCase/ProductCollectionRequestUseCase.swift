//
//  ProductCollectionRequestUseCase.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 Pankaj Bhardwaj. All rights reserved.
//

import UIKit


struct Status : Decodable {
    var code : Int?
    var msg : String?
}




struct ProductRequestDTO : BaseRequestDTO {
    var pageSize : Int?
    var page : Int?
    func createGetRequestUrl(url:String)-> URL?{
        //TODO : create
        
        return URL(string: url + "&pageSize=\(pageSize ?? 0)&page=\(page ?? 0)")
    }

}
struct ProductResponseDTO : BaseResponseDTO ,Decodable{
    var products : [Product]?
    var status : Status?
    var url : String?
    
}



class ProductCollectionRequestUseCase: BaseRequestUseCase<ProductRequestDTO,ProductResponseDTO > {
    
     var sessionTask : URLSessionTask?
    
    func initialize(requestDTO : ProductRequestDTO,completionHandler:@escaping(ProductResponseDTO?,Error?)->Void) {
        let baseUrl = Constants.homePageUrl
        let url = requestDTO.createGetRequestUrl(url: baseUrl)
        sessionTask?.cancel()
        sessionTask = super.getDataFromServerUsingGet(url: url!, requestDto: requestDTO, completionHandler: completionHandler)
    }
    override func decode(data: Data) throws -> ProductResponseDTO {
        let decoder = JSONDecoder()
        return try decoder.decode(ProductResponseDTO.self, from: data)
    }
}

