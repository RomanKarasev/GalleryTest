//
//  SignInViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - SignInViewController
class SignInViewController: UIViewController {
    
    // MARK: Properties
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password
    
    let signInView = SignInView()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        addActionsForButtons()
//        registerKeyboardNotification()
    }
    
    override func loadView() {
        super.loadView()
        view = signInView
    }
}

//MARK: PrivateMethods

private extension SignInViewController {
    
    func setDelegates() {
        signInView.emailTextField.delegate = self
        signInView.passwordTextField.delegate = self
    }
    
    func addActionsForButtons() {
        signInView.signINButton.addTarget(self,
                                          action: #selector(signINButtonTapped),
                                          for: .touchUpInside)
        signInView.signUPButton.addTarget(self,
                                          action: #selector(signUPButtonTapped),
                                          for: .touchUpInside)
    }
    
    //MARK: chechMailInUserData
    
    func chechMailInUserData(email: String) -> User? {
        let userData = UserData.shared.users
        
        for user in userData {
            if user.email == email {
                signInView.hiLabel.text = "Sign in to continue"
                signInView.hiLabel.textColor = .label
                return user
            }
        }
        return nil
    }
    
    func signIn() {
        
        let emailString = signInView.emailTextField.text ?? ""
        let passwordString = signInView.passwordTextField.text ?? ""
        let user = chechMailInUserData(email: emailString)
        
        if user == nil {
            signInView.hiLabel.text = "User Not Found"
            signInView.hiLabel.textColor = .red
        } else if user?.password == passwordString {
            signInView.hiLabel.text = "Sign in to continue"
            signInView.hiLabel.textColor = .label
            let vc = MainTabBarController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
            
            guard let activeUser = user else { return }
            UserData.shared.saveActiveUser(user: activeUser )
        } else {
            signInView.hiLabel.text = "Password not valid"
            signInView.hiLabel.textColor = .red
        }
    }
}

// MARK: - @objc extentions

@objc extension SignInViewController {
    
    func signINButtonTapped() {
        signIn()
    }
    
    func signUPButtonTapped() {
        self.dismiss(animated: true)
    }
}


//MARK: - UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        shouldChangeCharactersInRange(textField: textField, range: range, string: string)
        return false
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        signInView.emailTextField.resignFirstResponder()
        signInView.passwordTextField.resignFirstResponder()
        return true
    }
}

//MARK: - shouldChangeCharactersInRange

extension SignInViewController {
    
    func shouldChangeCharactersInRange(textField: UITextField, range: NSRange, string: String) {
        switch textField {
            case signInView.emailTextField: setTextFields(textField: signInView.emailTextField,
                                                          validTypes: emailValidType,
                                                          range: range,
                                                          string: string)
                
            case signInView.passwordTextField: setTextFields(textField: signInView.passwordTextField,
                                                             validTypes: passwordValidType,
                                                             range: range,
                                                             string: string)
            default:
                break
        }
    }
}


//MARK: - setTextFields

private extension SignInViewController {
    
    func setTextFields(textField: UITextField, validTypes: String.ValidTypes, range: NSRange, string: String) {
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
            signInView.hiLabel.text = "Sign in to continue"
            signInView.hiLabel.textColor = .label
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
}



