//
//  FlickerManager.swift
//  gefen
//
//  Created by or on 16/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import Foundation
import Alamofire

protocol FlickerManagerDelegate: class {
    func flickerManagerArrivedWithImagesData(imagesData:[ImageData])
}

class FlickerManager{
    static let ImagesUrl = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=044be8027d0bd24f8deaa2ac5923b48c&page=1&format=json&nojsoncallback=1&auth_token=72157694688577635-2ef7b0ad0763e5a8&api_sig=84534f491ce77d8007dabb9942980d61"
    
    static func sendPhotosRequest(completionHandler:@escaping ([ImageData])->()) {
        
        Alamofire.request(ImagesUrl).responseJSON { response in
            if let json = response.result.value,
            let jsonOBJ = json as? [String: Any],
            let mainJson = jsonOBJ["photos"] as? [String: Any],
            let imagesJson = mainJson["photo"] as? [[String: Any]]{
                self.parseImagesData(imagesJson: imagesJson, completionHandler: completionHandler)
                print(imagesJson)
            }
        }
    }
    
    static private func parseImagesData(imagesJson: [[String: Any]], completionHandler:([ImageData])->()) {
        
        var imagesData = [ImageData]()
        
        for imageJson in imagesJson {
            if let imageId = imageJson["id"] as? String,
                let userId = imageJson["owner"] as? String,
                let farm = imageJson["farm"] as? NSInteger,
                let server = imageJson["server"] as? String,
                let secret = imageJson["secret"] as? String{
              
                let imageData = ImageData.init(imageId: imageId, userId: userId, farm: "\(farm)", secret: secret, server: server)
                imagesData.append(imageData)
            }
        }
        
        completionHandler(imagesData)
        
    }
    
    static func getPhoto(imageData:ImageData, completionCallback:@escaping (ImageData)->() ) {
        
        
        let photoUrl = "https://farm\(imageData.farm).staticflickr.com/\(imageData.server)/\(imageData.imageId)_\(imageData.secret)_b.jpg"
        
        Alamofire.request(photoUrl).responseData(completionHandler: { (response) in
            print(response)
            guard let data = response.data else{return}
            imageData.image = UIImage(data: data)
            completionCallback(imageData)
        })
    }
}


