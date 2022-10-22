//
//  AddPhotoViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//


import UIKit

//MARK: - AddPhotoViewController

class AddPhotoViewController: UIViewController {

    // MARK: Properties
    var activeUser = UserData.shared.selectedUser
    let addPhotoView = AddPhotoView()
    var profilePhoho = [Data]()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.String.addPhotoVCTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        setDelegates()
        addActionsForButtons()
    }
    
    override func loadView() {
        super.loadView()
        view = addPhotoView
    }
}

//MARK: - PrivateMethods

private extension AddPhotoViewController {
    
    func setDelegates() {
    }
    
    func addActionsForButtons() {
        addPhotoView.addPhotoButton.addTarget(self,
                                              action: #selector(addPhotoButtonTapped),
                                              for: .touchUpInside)
    }
}

// MARK: - @objc extentions

@objc extension AddPhotoViewController {
    
    func addPhotoButtonTapped() {
        chooseImage()
    }
}

extension AddPhotoViewController {
    
}

//MARK: - Work with image

extension AddPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
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
        addPhotoView.imageView.image = info[.editedImage] as? UIImage
        
        guard let imageToData = addPhotoView.imageView.image?.pngData() else { return }
        guard let activeUser = UserData.shared.selectedUser else { return }
        
        UserData.shared.savePhotoToUser(user: activeUser, profilePhoto: imageToData)
        print(activeUser)
        dismiss(animated: true)
    }
}



