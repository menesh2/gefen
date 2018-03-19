//
//  PhotosLogic.swift
//  gefen
//
//  Created by NGSoft Mobile Leumi on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit

protocol PhotosLogicDelegate: class {
    func photosLogicImagesDataArrived()
}

class PhotosLogic {

    var imagesData:[ImageData]?
    weak var delegate: PhotosLogicDelegate?
    
    init() {
        FlickerManager.sendPhotosRequest(completionHandler: imagesRequestReturnedWithData)
    }
    
    func getNumberOfItems() ->NSInteger {
        return imagesData?.count ?? 0
    }
    
    func getImageDataForIndexPath(_ indexPath: IndexPath) ->ImageData {
        return imagesData?[indexPath.row] ?? ImageData()
    }
    
    func imagesRequestReturnedWithData(imagesData: [ImageData]) {
        self.imagesData = imagesData
        self.delegate?.photosLogicImagesDataArrived()
    }
}

