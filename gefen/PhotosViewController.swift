//
//  PhotosViewController.swift
//  gefen
//
//  Created by or on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography
import ImageOpenTransition

class PhotosViewController: UIViewController {
    
    let photosView:PhotosView
    let photosLogic:PhotosLogic
    
    init() {
        photosView = PhotosView()
        photosLogic = PhotosLogic()
        super.init(nibName: nil, bundle: nil)
        photosView.dataSource = self
        photosView.delegate = self
        photosLogic.delegate = self
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

extension PhotosViewController: PhotosLogicDelegate {
    func photosLogicOpenImageWithTransition(imageData: ImageData, fromCell selectedCell: CustomCollectionViewCell) {
        
        let vc = FullImageViewController()
        vc.coverImageView.image = imageData.image
        vc.avatarView.image = imageData.image
        
        let transitionObjectAvatar = ImageScaleTransitionObject(viewToAnimateFrom: selectedCell.imageView,
                                                                viewToAnimateTo: vc.avatarView,
                                                                duration: 0.4)
        
        let transitionObjectCover = ImageScaleTransitionObject(viewToAnimateFrom: selectedCell.imageView,
                                                               viewToAnimateTo: vc.coverImageView,
                                                               duration: 0.4,
                                                               frameToAnimateTo: vc.coverImageView.frame)
   
        
        let imageScalePresentTransition = ImageScaleTransitionDelegate(transitionObjects: [transitionObjectCover ,transitionObjectAvatar],
                                                                        usingNavigationController: false,
                                                                        duration: 0.4)
        vc.transitioningDelegate = imageScalePresentTransition;
        vc.modalPresentationStyle = UIModalPresentationStyle.custom;
        self.present(vc, animated: true, completion: nil)
    }
    
    func photosLogicImagesDataArrived() {
        DispatchQueue.main.async {
            self.photosView.reloadData()
        }
    }
}

extension PhotosViewController: PhotosViewDataSource {
    func PhotosViewGetNumberOfRows() -> NSInteger {
        return photosLogic.getNumberOfItems()
    }
    
    func PhotosViewGetImageDataForIndexPath(indexPath: IndexPath) -> ImageData {
        return photosLogic.getImageDataForIndexPath(indexPath)
    }
    
}

extension PhotosViewController: PhotosViewDelegate {
    func photosViewUserSelectedImageAtIndexPath(_ indexPath: IndexPath, FromSelectedCell selectedCell: CustomCollectionViewCell) {
        photosLogic.userSelectedImageAtIndexPath(indexPath, fromCell: selectedCell)
    }
   
}
