//
//  PhotosView.swift
//  gefen
//
//  Created by or on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

protocol PhotosViewDataSource: class {
    func PhotosViewGetNumberOfRows() -> NSInteger
    func PhotosViewGetImageDataForIndexPath(indexPath:IndexPath) ->ImageData
}

class PhotosView: UIView {

    //MARK: - variables
    let collectionView:UICollectionView
    weak var dataSource: PhotosViewDataSource?
    let cellId = "customCell"
    
    //MARK: - initializations
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(frame:CGRect.zero)
        addSubview(collectionView)
        setupConstraints()
        initViews()
        clipsToBounds = true
    }
    
    func initViews() {
    
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        constrain(collectionView){collectionView in
            guard let superView = collectionView.superview else {return}
            collectionView.edges == superView.edges
        }
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}

extension PhotosView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource?.PhotosViewGetNumberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCollectionViewCell
        cell.setImageData(imageData: dataSource?.PhotosViewGetImageDataForIndexPath(indexPath: indexPath))
        return cell
    }
    
}

extension PhotosView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.size.width/3 - 8 , height: bounds.size.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 10, 0, 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}
