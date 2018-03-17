//
//  LoginLogic.swift
//  gefen
//
//  Created by or on 17/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit

protocol LoginLogicDelegate: class {
    func loginLogicShowPopup(withTitle title:String?, andWithInfoText infoText:String?, andWithApproveButtonText buttonText:String! )
    func loginLogicPushViewController(viewController:UIViewController)
}

class LoginLogic {

    private let validUserName = "user123"
    private let validPassword = "12345"
    weak var delegate:LoginLogicDelegate?
    
    func LoginButtonPressed(userName:String, password:String) {
        var titleText = NSLocalizedString("mustFillAllFieldsTitle", comment: "")
        let infoText = NSLocalizedString("mustFillAllFieldsInfo", comment: "")
        let buttonText = NSLocalizedString("ok", comment: "")
        
        if userName.isEmpty || password.isEmpty {
            delegate?.loginLogicShowPopup(withTitle: titleText, andWithInfoText: infoText, andWithApproveButtonText:buttonText )
        }
        else if userName.capitalized == validUserName.capitalized && password == validPassword {
            //push view controller
        }
        else{
            titleText = NSLocalizedString("invalidUsernameOrPass", comment: "")
            delegate?.loginLogicShowPopup(withTitle: titleText, andWithInfoText: nil, andWithApproveButtonText: buttonText)
        }
    }
    
}
