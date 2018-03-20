//
//  FullImageViewController.swift
//  gefen
//
//  Created by NGSoft Mobile Leumi on 19/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

class FullImageViewController: UIViewController {

    var coverImageView:UIImageView!
    var avatarView:UIImageView!
    var image:UIImage!
    
    
    override func loadView() {
        super.loadView()
        
        let avatarImageSize : CGFloat = 60
        let avatarYPoint : CGFloat = 160
        let frameToAnimateToAvatar = CGRect(x:(self.view.frame.size.width/2) - (avatarImageSize/2),y: avatarYPoint,width: avatarImageSize,height: avatarImageSize)
        let frameToAnimateToCover = CGRect(x: 0,y:  0,width:  self.view.frame.size.width , height:  200)
        
        self.coverImageView = UIImageView()
        self.coverImageView.image = image
        self.coverImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.coverImageView.clipsToBounds = true
        self.coverImageView.frame = frameToAnimateToCover
        self.view.addSubview(self.coverImageView)
        
        self.avatarView = UIImageView()
        self.avatarView.image = image
        self.avatarView.frame = frameToAnimateToAvatar
        self.avatarView.contentMode = UIViewContentMode.scaleAspectFill
        self.avatarView.clipsToBounds = true
        self.view.addSubview(self.avatarView)
        
        self.view.backgroundColor = UIColor.white
    }
    
}
