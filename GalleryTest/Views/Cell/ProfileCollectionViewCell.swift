//
//  ProfileCollectionViewCell.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//


import Foundation
import UIKit

//MARK: - ProfileCollectionViewCell

class ProfileCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = Resources.String.identifier
    
    let banerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    func configureCell(index: IndexPath) {
        
        guard let activeUserWithFoto = UserData.shared.selectedUserWithPhoto else { return }
        guard let imageData = activeUserWithFoto.profilePhoto else { return }
        
        let imageFromData = UIImage(data: imageData)
        
        
        if index.row == 0 {
            banerImageView.image = imageFromData
        } else if index.row == 1 {
            banerImageView.image = Resources.defaultProfileImage
        }
    }
    
    private func setConstraints() {
        addSubview(banerImageView)
        NSLayoutConstraint.activate(
            [banerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
             banerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
             banerImageView.heightAnchor.constraint(equalTo: heightAnchor),
             banerImageView.widthAnchor.constraint(equalTo: widthAnchor)
            ]
        )
    }
}

