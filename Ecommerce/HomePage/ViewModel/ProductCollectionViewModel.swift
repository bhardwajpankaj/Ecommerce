//
//  ProductCollectionViewModel.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 Pankaj Bhardwaj. All rights reserved.
//


class ProductCollectionViewModel: BaseViewModel {
    
    private var currentPage : Int = 0
    private let pageSize : Int = 30
    private var requestUseCase :ProductCollectionRequestUseCase?
    var boolLoading : Bool = false
    var boolMoreDataAvailable : Bool = true
    var arrCollectionData : [Product]?
    
    var numberOfSection = 0
    
    
    
    func getProductInfoFromStarting(completionHandler :@escaping (String?)->Void,useCase : ProductCollectionRequestUseCase = ProductCollectionRequestUseCase()) {
        currentPage = 0
        boolMoreDataAvailable = true
        getProductInfo(pageNo: currentPage, pageSize: pageSize, completionHandler: completionHandler,useCase: useCase)
    }
    func getNextProductInfo(completionHandler :@escaping (String?)->Void,useCase : ProductCollectionRequestUseCase = ProductCollectionRequestUseCase()) {
        getProductInfo(pageNo: currentPage, pageSize: pageSize, completionHandler: completionHandler,useCase: useCase)
    }
    
    private func getProductInfo(pageNo : Int , pageSize : Int ,  completionHandler : @escaping(String?)->Void ,useCase : ProductCollectionRequestUseCase = ProductCollectionRequestUseCase() ) {
        boolLoading = true;
        let requestDTO = ProductRequestDTO(pageSize: pageSize, page: pageNo)
        requestUseCase = useCase
        requestUseCase?.initialize(requestDTO: requestDTO, completionHandler: { (responseDTO, error) in
            self.boolLoading = false
            if(error != nil)
            {
                completionHandler(error.debugDescription)
            }else
            {
                if responseDTO?.status?.code == 404{
                    self.boolMoreDataAvailable = false
                    completionHandler(nil)
                }else {
                    if self.currentPage == 0 {
                        self.arrCollectionData = responseDTO?.products
                    }else {
                        self.arrCollectionData?.append(contentsOf:(responseDTO?.products)!)
                    }
                    self.currentPage = self.currentPage + 1
                    completionHandler(nil)
                }
            }
        })
    }
    
}
