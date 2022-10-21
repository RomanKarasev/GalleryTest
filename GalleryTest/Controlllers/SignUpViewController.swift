//
//  SignUpViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - AuthenticationViewController
class SignUpViewController: UIViewController {
    
    // MARK: Properties
    
    let signUpView = SignUpView()
    
    let nameValidType: String.ValidTypes = .name
    let emailValidType: String.ValidTypes = .email
    let passwordValidType: String.ValidTypes = .password
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        addActionsForButtons()
        registerKeyboardNotification()
    }
    
    override func loadView() {
        super.loadView()
        view = signUpView
    }
    
    deinit {
        removeKeyboardNotification()
    }
}

//MARK: PrivateMethods

private extension SignUpViewController {
    
    //MARK: setDelegates
    
    func setDelegates() {
        signUpView.nameTextField.delegate = self
        signUpView.secondNameTextField.delegate = self
        signUpView.numberTextField.delegate = self
        signUpView.emailTextField.delegate = self
        signUpView.passwordTextField.delegate = self
    }
    
    //MARK: addActionsForButtons
    
    func addActionsForButtons() {
        signUpView.imageButton.addTarget(self,
                                         action: #selector(imageButtonTapped),
                                         for: .touchUpInside)
        
        signUpView.dateButton.addTarget(self,
                                        action: #selector(dateButtonButtonTapped),
                                        for: .touchUpInside)
        
        signUpView.signUPButton.addTarget(self,
                                          action: #selector(signUPButtonTapped),
                                          for: .touchUpInside)
        
        signUpView.signINButton.addTarget(self,
                                          action: #selector(signINButtonTapped),
                                          for: .touchUpInside)
    }
    
    //MARK: addResignFirstResponder
    
    func addResignFirstResponder() {
        signUpView.nameTextField.resignFirstResponder()
        signUpView.secondNameTextField.resignFirstResponder()
        signUpView.numberTextField.resignFirstResponder()
        signUpView.emailTextField.resignFirstResponder()
        signUpView.passwordTextField.resignFirstResponder()
    }
}

// MARK: - @objc extentions

@objc extension SignUpViewController {
    
    func imageButtonTapped() {
        print("imageButtonTapped")
    }
    
    func dateButtonButtonTapped() {
        alertDate(label: signUpView.dateLabel,
                  button: signUpView.dateButton,
                  labelAge: signUpView.ageLabel,
                  vericationLabel: signUpView.dateVerificationLabel)
    }
    
    func signUPButtonTapped() {
        let signInViewController = SignInViewController()
        self.present(signInViewController, animated: true)
    }
    
    func signINButtonTapped() {
        let signInViewController = SignInViewController()
        self.present(signInViewController, animated: true)
    }
}

//MARK: - KeyboarNotification

private extension SignUpViewController {
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyBoardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        signUpView.loginBackgroundScrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight / 3)
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        signUpView.loginBackgroundScrollView.contentOffset = CGPoint.zero
    }
}

//MARK: - UITextFieldDelegate

extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        shouldChangeCharactersInRange(textField: textField, range: range, string: string)
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addResignFirstResponder()
        return true
    }
}

