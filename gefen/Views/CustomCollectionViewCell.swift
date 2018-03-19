//
//  CustomCollectionViewCell.swift
//  gefen
//
//  Created by NGSoft Mobile Leumi on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

class CustomCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView
    var imageData: ImageData?
   
    required init?(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: aDecoder)
        addSubview(imageView)
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        super.init(frame: frame)
        addSubview(imageView)
        setupConstraints()
    }
    
    func setImageData(imageData:ImageData?) {
        self.imageData = imageData
        getImageFromServer()
    }
    
    func getImageFromServer() {
        guard let imageData = imageData else {return}
        FlickerManager.getPhoto(imageData: imageData, completionCallback: imageArrived)
    }
    
    func setupConstraints() {
        constrain(imageView, self) {view, superView in
            view.edges == superView.edges
        }
    }
    
    func imageArrived(imageData:ImageData) {
        if imageData.imageId == self.imageData?.imageId {
            DispatchQueue.main.async {
                self.imageView.image = imageData.image
            }
        }
    }
}
