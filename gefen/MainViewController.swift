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
    let loginLogic: LoginLogic
    
    init() {
        loginView = LoginView()
        loginLogic = LoginLogic()
        super.init(nibName: nil, bundle: nil)
        loginLogic.delegate = self
        loginView.delegate = self
        view.addSubview(loginView)
        setupConstraints()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        constrain(loginView) {loginView in
            guard let superView = loginView.superview else {return}
            loginView.left == superView.left + 40
            loginView.right == superView.right - 40
            loginView.centerY == superView.centerY
            
        }
    }

}

extension MainViewController: LoginViewDelegate {
    func loginViewUserPressedLoginButton(withUserName UserName: String, andWithPassword password: String) {
        loginLogic.LoginButtonPressed(userName: UserName, password: password)
    }
}

extension MainViewController: LoginLogicDelegate {
   
    func loginLogicShowPopup(withTitle title: String?, andWithInfoText infoText: String?, andWithApproveButtonText buttonText: String!) {
        let alert = UIAlertController(title: title, message: infoText, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertActionStyle.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func loginLogicPushViewController(viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    
}

