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
    let userNameTextField:TextFieldWithHintText
    let passwordTextField:TextFieldWithHintText
    
    //MARK: - initialozations
    init() {
        
        loginButton = UIButton()
        userNameTextField = TextFieldWithHintText()
        passwordTextField = TextFieldWithHintText()
        super.init(frame: CGRect.zero)
        
        initViews()
        setupConstraints()
    }
    
    func initViews() {
        loginButton.setTitle(NSLocalizedString("LoginButtonTitle", comment: ""), for: .normal)
        loginButton.backgroundColor = UIColor.blue
        loginButton.layer.cornerRadius = 5
        loginButton.isUserInteractionEnabled = true
        loginButton.addTarget(self, action: #selector(didPressLoginButton(_sender:)), for: .touchUpInside)
        loginButton.setTitleColor(UIColor.gray, for: .highlighted)
        userNameTextField.setHintText("userName")
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setHintText("password")
        
        
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
            button.centerX == superView.centerX
            button.bottom == superView.bottom
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - login Button
    @objc func didPressLoginButton(_sender: UIButton!) {
        
    }
    
}
