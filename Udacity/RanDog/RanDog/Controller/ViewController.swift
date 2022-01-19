//
//  ViewController.swift
//  RanDog
//
//  Created by Rakesh Dama  on 15/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url1 = DogAPI.EndPoint.randomDogsFromAllCollection.url
        
        let task = URLSession.shared.dataTask(with: url1) { data, response, error in
            guard let data = data else {
                print("No Data")
                return
            }
            
            //MARK:- Using Codable to decode the JSON Data
            let decoder = JSONDecoder()
            let imageData = try! decoder.decode(DogImage.self, from: data)
            let url2 = URL(string: imageData.message)!
            
            DogAPI.requestImage(url: url2, completionHander: self.handleImageFileResponse(image:error:))
            
        }
        
        task.resume()
    }

    func handleImageFileResponse(image: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
}

