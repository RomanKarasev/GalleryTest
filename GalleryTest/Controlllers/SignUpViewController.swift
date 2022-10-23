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
    
    //MARK: SaveData
    
    func signUPAndsaveData() {
        //данные после регистрации
        let nameString = signUpView.nameTextField.text ?? Resources.String.emptyLabelText
        let secondNameString = signUpView.secondNameTextField.text ?? Resources.String.emptyLabelText
        let numberString = signUpView.numberTextField.text ?? Resources.String.emptyLabelText
        let emailString = signUpView.emailTextField.text ?? Resources.String.emptyLabelText
        let passwordString = signUpView.passwordTextField.text ?? Resources.String.emptyLabelText
        let ageString = signUpView.ageLabel.text ?? Resources.String.emptyLabelText
        let dateString = signUpView.dateLabel.text ?? Resources.String.emptyLabelText
        guard let age = Int(ageString) else { return }
        guard  let profileImageData = signUpView.profileImageView.image?.pngData() else { return }
        
        //Проверяю, если все данные соответствуют условиям
        if nameString.isValid(validTypes: nameValidType)
            && secondNameString.isValid(validTypes: nameValidType)
            && numberString.count == 18
            && emailString.isValid(validTypes: emailValidType)
            && passwordString.isValid(validTypes: passwordValidType)
            && age >= 18 {
            //Сохраняю все в Базу
            UserData.shared.saveData(name: nameString,
                                     secondName: secondNameString,
                                     date: dateString,
                                     dateNow: Resources.String.emptyLabelText,
                                     age: ageString,
                                     number: numberString,
                                     email: emailString,
                                     password: passwordString,
                                     profileImage: profileImageData,
                                     profilePhoto: Data()
            )
            signUpView.hiLabel.text = Resources.String.signInCompleted
            signUpView.hiLabel.textColor = .green
        } else {
            signUpView.hiLabel.text = Resources.String.WrongMessages.error
            signUpView.hiLabel.textColor = .red
        }
    }
}

// MARK: - @objc extentions

@objc extension SignUpViewController {
    
    func imageButtonTapped() {
        chooseImage()
    }
    
    func dateButtonButtonTapped() {
        alertDate(label: signUpView.dateLabel,
                  button: signUpView.dateButton,
                  labelAge: signUpView.ageLabel,
                  vericationLabel: signUpView.dateVerificationLabel)
    }
    
    func signUPButtonTapped() {
        signUPAndsaveData()
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

//MARK: - Work with image

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func chooseImage() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        signUpView.profileImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}

