//
//  ViewController.swift
//  gefen
//
//  Created by or on 16/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

class MainViewController: UIViewController {
    

    let loginView: LoginView
    
    init() {
        loginView = LoginView()
        super.init(nibName: nil, bundle: nil)
        view.addSubview(loginView)
        setupConstraints()
        view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        constrain(loginView) {loginView in
            guard let superView = loginView.superview else {return}
            loginView.centerX == superView.centerX
            loginView.centerY == superView.centerY
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

