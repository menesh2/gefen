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
    let loadingIndicator: UIActivityIndicatorView
    var imageData: ImageData?
    
   
    required init?(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        loadingIndicator = UIActivityIndicatorView()
        super.init(coder: aDecoder)
        addSubview(imageView)
        addSubview(loadingIndicator)
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        loadingIndicator = UIActivityIndicatorView()
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(loadingIndicator)
        setupConstraints()
    }
    
    func initViews() {
        imageView.isHidden = true
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
    }
    
    func setImageData(imageData:ImageData?) {
        self.imageData = imageData
        if(imageData?.image == nil) {
             getImageFromServer()
        }
        else {
            self.imageView.image = imageData?.image
        }
       
    }
    
    func getImageFromServer() {
        guard let imageData = imageData else {return}
        FlickerManager.getPhoto(imageData: imageData, completionCallback: imageArrived)
    }
    
    func setupConstraints() {
        constrain(imageView, loadingIndicator, self) {view, loadingIndicator, superView in
            view.edges == superView.edges
            loadingIndicator.edges == superView.edges
        }
    }
    
    func imageArrived(imageData:ImageData) {
        
        DispatchQueue.main.async {
            self.imageView.image = imageData.image
            self.imageView.isHidden = false
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
        }
        
    }
}
