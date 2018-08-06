//
//  BaseRequestUseCase.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 Pankaj Bhardwaj. All rights reserved.
//

import UIKit

protocol BaseRequestDTO {
    func createGetRequestUrl(url:String)-> URL?
}


protocol BaseResponseDTO {
    var url : String? {get set}
    var status : Status? {get set}
}


class BaseRequestUseCase <S : BaseRequestDTO ,T : BaseResponseDTO > {
    
    func initialize(requestDTO : S)  {
        fatalError("This is an Abstract Base class, Method should be override")
        
    }
    func getDataFromServerUsingGet(url : URL, requestDto:S, completionHandler:@escaping(T? , Error?) -> Void) -> URLSessionTask{
        
        return NetworkManager.shared.getData(url:url) { (data, error) in
            if let error = error  {
                DispatchQueue.main.sync {
                    completionHandler(nil , error)
                }
            }else{
                guard let unwrappedData = data else {
                    DispatchQueue.main.sync {
                        completionHandler(nil,nil);
                    }
                    return
                }
                do {
                    let response = try self.decode(data: unwrappedData)
                    DispatchQueue.main.sync {
                        completionHandler(response,nil)
                    }
                }
                catch {
                    DispatchQueue.main.sync {
                        completionHandler(nil,error)
                    }
                }
            }
            
        }
        
    }
    
    func decode(data : Data)throws -> T {
        fatalError("This is an Abstract Base class, Method should be override")
    }
}
