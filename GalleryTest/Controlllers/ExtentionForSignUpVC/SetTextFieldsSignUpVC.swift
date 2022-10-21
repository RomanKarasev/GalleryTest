//
//  SetTextFieldExtForSignUpVC.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - shouldChangeCharactersInRange

extension SignUpViewController {
    
    func shouldChangeCharactersInRange(textField: UITextField, range: NSRange, string: String) {
        switch textField {
            case signUpView.nameTextField: setTextFields(textField: signUpView.nameTextField,
                                                         label: signUpView.nameVerificationLabel,
                                                         validTypes: nameValidType,
                                                         wrongMessage: Resources.String.wrongMessages.name,
                                                         range: range,
                                                         string: string)
                
            case signUpView.secondNameTextField: setTextFields(textField: signUpView.secondNameTextField,
                                                               label: signUpView.secondNameVerificationLabel,
                                                               validTypes: nameValidType,
                                                               wrongMessage: Resources.String.wrongMessages.name,
                                                               range: range,
                                                               string: string)
                
            case signUpView.emailTextField: setTextFields(textField: signUpView.emailTextField,
                                                          label: signUpView.emailVerificationLabel,
                                                          validTypes: emailValidType,
                                                          wrongMessage: Resources.String.wrongMessages.email,
                                                          range: range,
                                                          string: string)
                
            case signUpView.passwordTextField: setTextFields(textField: signUpView.passwordTextField,
                                                             label: signUpView.passwordVerificationLabel,
                                                             validTypes: passwordValidType,
                                                             wrongMessage: Resources.String.wrongMessages.password,
                                                             range: range,
                                                             string: string)
                
            case signUpView.numberTextField: setNumberTextField(textField: signUpView.numberTextField,
                                                                label: signUpView.numberVerificationLabel,
                                                                range: range,
                                                                string: string)
            default:
                break
        }
    }
}


//MARK: - setTextFields

private extension SignUpViewController {
    
    
    
    func setTextFields(textField: UITextField, label: UILabel, validTypes: String.ValidTypes, wrongMessage: String,  range: NSRange, string: String) {
        let text = (textField.text ?? "") + string
        let result: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex,
                                 offsetBy: text.count - 1)
            result = String(text[text.startIndex..<end])
        } else {
            result = text
        }
        
        textField.text = result
        
        if result.isValid(validTypes: validTypes) {
            textField.layer.borderColor = UIColor.green.cgColor
            label.isHidden = true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            label.isHidden = false
            label.text = wrongMessage
        }
    }
}

//MARK: - setNumberTextField

private extension SignUpViewController {
    
    
    func formatPhoneNumber(number: String, textField: UITextField, label: UILabel) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+X (XXX) XXX-XX-XX"
        
        var result = ""
        var index = cleanPhoneNumber.startIndex
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        if result.count == 18 {
            textField.layer.borderColor = UIColor.green.cgColor
            label.isHidden = true
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            label.isHidden = false
            label.text = Resources.String.wrongMessages.number
        }
        
        return result
    }
    
    //MARK: setNumberTextField
    
    func setNumberTextField(textField: UITextField, label: UILabel, range: NSRange, string: String) {
        guard let text = textField.text else { return }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = formatPhoneNumber(number: newString, textField: textField, label: label)
    }
}
