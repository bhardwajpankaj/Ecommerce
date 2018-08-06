//
//  UIImageView+Extension.swift
//  Ecommerce
//
//  Created by Pankaj Bhardwaj on 04/08/18.
//  Copyright © 2018 pankajBhardwaj. All rights reserved.
//

import UIKit
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
   
    func downloadImage(from imgURL: String, placeholderImageName:String) -> URLSessionTask? {
        let url = URLRequest(url: URL(string: imgURL)!)
        // check if the image is already in the cache
        if let imageToCache = imageCache.object(forKey: imgURL as NSString) {
            self.image = imageToCache
            return nil
        }
        
        
        self.image = UIImage(named:placeholderImageName)
        
        // download the image asynchronously
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            if error != nil {
                print(error!)
                return
            }
            if let imageData = data
            {
                let imageToCache = UIImage(data: imageData) ?? UIImage()
                imageCache.setObject(imageToCache, forKey: imgURL as NSString)
                DispatchQueue.main.async {
                  self.image = imageToCache
                }
            }
            
        }
        task.resume()
        return task
    }
}
