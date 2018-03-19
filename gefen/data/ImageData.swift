//
//  ImageData.swift
//  gefen
//
//  Created by or on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit

class ImageData {

    var imageId: String
    var userId: String
    var image: UIImage?
    var farm: String
    var secret: String
    var server: String
    
    
    init(imageId:String, userId:String, farm: String, secret:String, server: String) {
        self.imageId = imageId
        self.userId = userId
        self.farm = farm
        self.secret = secret
        self.server = server
    }
    
    init() {
        imageId = ""
        userId = ""
        farm = ""
        secret = ""
        server = ""
    }
    
}
