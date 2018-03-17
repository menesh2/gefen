//
//  TextFieldWithHintText.swift
//  gefen
//
//  Created by or Leumi on 16/03/2018.
//  Copyright © 2018 Or. All rights reserved.
//

import UIKit

protocol TextFieldWithHintTextDelegate: class {
    func textFieldWithHintTextDelegate(_ textField: TextFieldWithHintText, shouldChangeCharactersIn range: NSRange, replacmentString string: String) ->Bool
}

class TextFieldWithHintText: UITextField, UITextFieldDelegate {
    
    //MARK: variavles
    private var hintText = ""
    private var shouldSecureTextEntry = false
    weak var newDelegate: TextFieldWithHintTextDelegate?
    
    
    //MARK: - initializations
    
    init() {
        super.init(frame:CGRect.zero)
        delegate = self
        backgroundColor = UIColor(red: 249, green: 249, blue: 249)
        layer.cornerRadius = 5
        showHintText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText() ->String! {
        var textToReturn = text
        if text == hintText,
            textColor == UIColor.lightGray {
            textToReturn = ""
        }
        return textToReturn
    }
    
    func setHintText(_ hintText: String) {
        self.hintText = hintText
        if text == nil || text == "" {
            showHintText()
        }
    }
    
    
    private func showHintText() {
        shouldSecureTextEntry = isSecureTextEntry
        isSecureTextEntry = false
        text = hintText
        textColor = UIColor.lightGray
    }
    
    private func hideHintText() {
        isSecureTextEntry = shouldSecureTextEntry
        if text == hintText {
            text = ""
            textColor = UIColor.black
        }
    }
    
    
    //MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return newDelegate?.textFieldWithHintTextDelegate(self, shouldChangeCharactersIn: range, replacmentString: "\(textField.text ?? "")\(string)") ?? true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        hideHintText()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if text?.isEmpty ?? false {
            showHintText()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}
