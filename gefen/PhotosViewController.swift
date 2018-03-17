//
//  PhotosViewController.swift
//  gefen
//
//  Created by or on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

class PhotosViewController: UIViewController {
    
    let photosView:PhotosView
    let photosLogic:PhotosLogic
    
    init() {
        photosView = PhotosView()
        photosLogic = PhotosLogic()
        super.init(nibName: nil, bundle: nil)
        photosView.dataSource = self
        view.addSubview(photosView)
        setupConstraints()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor.white
    }
    
    func setupConstraints() {
        constrain(photosView, view){photosView, superView in
            photosView.edges == inset(superView.edges, 20, 0, 0, 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension PhotosViewController: PhotosViewDataSource {
    func PhotosViewGetNumberOfRows() -> NSInteger {
        return photosLogic.getNumberOfItems()
    }
    
    func PhotosViewGetCellForIndexPath(indexPath: IndexPath) -> UICollectionViewCell {
        return photosLogic.getCellForIndexPath(indexPath)
    }
    
    
}
