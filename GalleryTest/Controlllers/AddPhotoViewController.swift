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
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.String.addPhotoVCTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        addActionsForButtons()
    }
    
    override func loadView() {
        super.loadView()
        view = addPhotoView
    }
}

//MARK: - PrivateMethods

private extension AddPhotoViewController {
    
    func addActionsForButtons() {
        addPhotoView.addPhotoButton.addTarget(self,
                                              action: #selector(addPhotoButtonTapped),
                                              for: .touchUpInside)
    }
    
    func saveDateAndImageToData(image: UIImage?) {
        guard let newImage = image else { return }
        
        guard let activeUser = UserData.shared.selectedUser else { return }
        let dateNow = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm"
        let dateString = dateFormatter.string(from: dateNow)
        
        Resources.imagesArray.insert(newImage, at: 0)
        
        UserData.shared.saveDateToUser(user: activeUser, dateNow: dateString)
    }
}

// MARK: - @objc extentions

@objc extension AddPhotoViewController {
    
    func addPhotoButtonTapped() {
        chooseImage()
    }
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
        let imageNew = info[.editedImage] as? UIImage
        addPhotoView.imageView.image = imageNew
        saveDateAndImageToData(image: imageNew)
        dismiss(animated: true)
    }
}
