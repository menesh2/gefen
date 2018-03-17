//
//  FlickerMenager.swift
//  gefen
//
//  Created by or on 16/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import Foundation
import Alamofire

class FlickerMenager{

    final let secretKey = "f0724a29ba324849"
    final let privateKey = "2fde8abf68f0be0492b4e89420438575"
    let request = "https://www.flickr.com/services/oauth/request_token"
    
    init() {
        Alamofire.request(request).responseJSON { response in
            if let json = response.result.value {
                let jsonOBJ = json as! [String: AnyObject]
                print(jsonOBJ)
            }
        }
    }
}
