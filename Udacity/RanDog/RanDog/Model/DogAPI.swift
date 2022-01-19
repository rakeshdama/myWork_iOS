//
//  DogAPI.swift
//  RanDog
//
//  Created by Rakesh Dama  on 15/09/21.
//

import UIKit

class DogAPI {
    enum EndPoint: String {
        case randomDogsFromAllCollection = "https://dog.ceo/api/breeds/image/random"
        
        var url: URL {
            return URL(string: self.rawValue)!
        }
        
    }
    
    class func requestImage(url: URL, completionHander: @escaping (UIImage?, Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHander(nil, error)
                return
            }
            
            let image = UIImage(data: data)
            completionHander(image, nil)
        }
        
        task.resume()
    }
    
    
}
