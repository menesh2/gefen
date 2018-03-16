//
//  LoginView.swift
//  gefen
//
//  Created by or Leumi on 16/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit
import Cartography

protocol LoginViewDelegate: class {
    func loginViewUserPressedLoginButton()
}

class LoginView: UIView {
    
    //MARK: - variables
    weak var delegate:LoginViewDelegate?
    let loginButton:UIButton
    let userNameTextField:UITextField
    let passwordTextField:UITextField
    
    //MARK: - initialozations
    init() {
        
        loginButton = UIButton()
        userNameTextField = UITextField()
        passwordTextField = UITextField()
        super.init(frame: CGRect.zero)
        
        initViews()
        setupConstraints()
    }
    
    func initViews() {
        loginButton.setTitle(NSLocalizedString("LoginButtonTitle", comment: ""), for: .normal)
        userNameTextField.text = "userName"
        passwordTextField.text = "password"
        
        addSubview(loginButton)
        addSubview(userNameTextField)
        addSubview(passwordTextField)
        
        clipsToBounds = true
    }
    
    func setupConstraints() {
        constrain(loginButton , userNameTextField, passwordTextField, self) {button, userNameTextField, passTextField, superView in
        
            userNameTextField.top == superView.top
            userNameTextField.left == superView.left
            userNameTextField.right == superView.right
            
            passTextField.top == userNameTextField.bottom + 20
            passTextField.left == superView.left
            passTextField.right == superView.right
            
            button.top == passTextField.bottom + 20
            button.left == superView.left
            button.right == superView.right
            button.bottom == superView.bottom
            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
