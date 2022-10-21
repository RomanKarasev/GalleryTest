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
    
    let addPhotoView = AddPhotoView()
    
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
        print("addPhotoButtonTapped")
    }
}



