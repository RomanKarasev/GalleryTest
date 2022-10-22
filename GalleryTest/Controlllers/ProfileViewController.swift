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
        profileView.profileCollectionView.reloadData()
        
        
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
    
    func didSelectProfilePhoto() {
        let vc = DetailViewController()
        self.present(vc, animated: true)
    }
    
    func setModel() {
        
        
        guard let activeUser = UserData.shared.selectedUser else { return }
        let profileNameText = activeUser.name + " " +  activeUser.secondName
        let ageText = "\(activeUser.age) y.o."
        profileView.profileImageView.image = UIImage(data: activeUser.profileImage)
        profileView.profileNameLabel.text = profileNameText
        profileView.profileYearLabel.text = ageText
        
        
        
    }
}

// MARK: - @objc extentions

@objc extension ProfileViewController {
    
}

// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
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
        didSelectProfilePhoto()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 140, height: 140)
    }
}
