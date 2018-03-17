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
   
    required init?(coder aDecoder: NSCoder) {
        imageView = UIImageView()
        super.init(coder: aDecoder)
        addSubview(imageView)
        setupConstraints()
        initViews()
    }
    
    func initViews() {
        
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        super.init(frame: frame)
        addSubview(imageView)
        setupConstraints()
        initViews()
    }
    
    func setupConstraints() {
        constrain(imageView, self) {view, superView in
            view.edges == superView.edges
        }
    }
}
