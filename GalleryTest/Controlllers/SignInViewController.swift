//
//  SignInViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

class SignInViewController: UIViewController {

    
    let signInView = SignInView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        addActionsForButtons()
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
}

@objc extension SignInViewController {
    
    func signINButtonTapped() {
        let vc = MainTabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func signUPButtonTapped() {
        self.dismiss(animated: true)
    }
}

extension SignInViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        signInView.emailTextField.resignFirstResponder()
        signInView.passwordTextField.resignFirstResponder()
        return true
    }
}


