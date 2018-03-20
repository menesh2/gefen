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

    let coverImageView:UIImageView
    let avatarView:UIImageView
    let backButton: UIButton
    
    init() {
        coverImageView = UIImageView()
        avatarView = UIImageView()
        backButton = UIButton()
        super.init(nibName: nil, bundle: nil)
        view.addSubview(coverImageView)
        view.addSubview(avatarView)
        view.addSubview(backButton)
        setupConstraints()
        initViews()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor.white
    }
    
    func initViews() {
        backButton.setTitle("<", for: .normal)
        backButton.backgroundColor = UIColor.blue
        backButton.layer.cornerRadius = 10
        backButton.isUserInteractionEnabled = true
        backButton.addTarget(self, action: #selector(didPressBackButton(_:)), for: .touchUpInside)
        backButton.setTitleColor(UIColor.gray, for: .highlighted)
    }
    
    func setupConstraints() {
        
        constrain(coverImageView, avatarView, backButton, view){coverImageView, avatarView, backButton, superView in
            coverImageView.width == superView.width
            coverImageView.top == superView.top
            coverImageView.bottom == superView.centerY
            
            avatarView.width == 160
            avatarView.height == 160
            avatarView.centerX == coverImageView.centerX
            avatarView.centerY == coverImageView.bottom
            
            backButton.top == superView.bottom
            backButton.centerX == superView.centerX
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didPressBackButton(_ sender:UIButton!) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7) {
            constrain(self.backButton, self.view){btn, superView in
                btn.top == superView.centerY + 150
            }
            self.view.layoutIfNeeded()
        }
    }
}
