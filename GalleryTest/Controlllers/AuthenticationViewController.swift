//
//  AuthenticationViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - AuthenticationViewController
class AuthenticationViewController: UIViewController {
    
    // MARK: Properties
    
    let authenticationView = AuthenticationView()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        addActionsForButtons()
    }
    
    override func loadView() {
        super.loadView()
        view = authenticationView
    }
}

//MARK: PrivateMethods

private extension AuthenticationViewController {
    
    func setDelegates() {
        authenticationView.nameTextField.delegate = self
        authenticationView.secondNameTextField.delegate = self
        authenticationView.numberTextField.delegate = self
        authenticationView.emailTextField.delegate = self
        authenticationView.passwordTextField.delegate = self
    }
    
    func addActionsForButtons() {
        authenticationView.imageButton.addTarget(self,
                                                 action: #selector(imageButtonTapped),
                                                 for: .touchUpInside)
        
        authenticationView.dateButton.addTarget(self,
                                                action: #selector(dateButtonButtonTapped),
                                                for: .touchUpInside)
        
        authenticationView.signUPButton.addTarget(self,
                                                  action: #selector(signUPButtonTapped),
                                                  for: .touchUpInside)
        
        authenticationView.signINButton.addTarget(self,
                                                  action: #selector(signINButtonTapped),
                                                  for: .touchUpInside)
    }
}

// MARK: - @objc extentions

@objc extension AuthenticationViewController {
    
    func imageButtonTapped() {
        print("imageButtonTapped")
    }
    
    func dateButtonButtonTapped() {
        print("dateButtonButtonTapped")
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

//MARK: - UITextFieldDelegate

extension AuthenticationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        authenticationView.nameTextField.resignFirstResponder()
        authenticationView.secondNameTextField.resignFirstResponder()
        authenticationView.numberTextField.resignFirstResponder()
        authenticationView.emailTextField.resignFirstResponder()
        authenticationView.passwordTextField.resignFirstResponder()
        return true
    }
}

