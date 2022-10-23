//
//  ProfileViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - ProfileViewController

class ProfileViewController: UIViewController {
    
    // MARK: Properties
    
    let profileView = ProfileView()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        title = Resources.String.profileVCTitle
        setModel()
    }
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileView.profileCollectionView.reloadData()
    }
}

//MARK: - PrivateMethods

private extension ProfileViewController {
    
    func setDelegates() {
        profileView.profileCollectionView.delegate = self
        profileView.profileCollectionView.dataSource = self
    }
    
    func didSelectProfilePhoto(index: IndexPath) {
        
        let imageNew = Resources.imagesArray[index.row]
        
        guard let imageToData = imageNew.pngData() else { return }
        guard let activeUser = UserData.shared.selectedUser else { return }
        
        UserData.shared.savePhotoToUser(user: activeUser, profilePhoto: imageToData)
        print(activeUser)
        
        let vc = DetailViewController()
        self.present(vc, animated: true)
    }
    
    func setModel() {
        
        guard let activeUser = UserData.shared.selectedUser else { return }
        let profileNameText = activeUser.name + " " +  activeUser.secondName
        let ageText = "\(activeUser.age) y.o."
        profileView.profileImageView.image = UIImage(data: activeUser.profileImage)
        profileView.profileNameLabel.text = profileNameText
        profileView.profileYearLabel.text = ageText    }
}

// MARK: - @objc extentions

@objc extension ProfileViewController {
    
}

// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Resources.imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier,
                                                            for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell(index: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        didSelectProfilePhoto(index: indexPath)
    }
}
