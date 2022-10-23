//
//  ProfileView.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit


//MARK: - ProfileView

class ProfileView: UIView {
    
    //MARK: Properties
    
    //MARK: View
    
    let topBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainAccentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.defaultProfileImage
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.mainBorderColor.cgColor
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        layout.itemSize = Resources.itemSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProfileCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: Label
    
    let profileNameLabel = UILabel(text: Resources.String.emptyLabelText,
                                   font: .appleSDGothicNeoSemiBold25(),
                                   alignment: .left,
                                   textColor: .label)
    
    let profileYearLabel = UILabel(text: Resources.String.emptyLabelText,
                                   font: .appleSDGothicNeo15(),
                                   alignment: .left,
                                   textColor: .label)
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setConstraints

extension ProfileView {
    
    private func setConstraints() {
        let topBackgroundViewHeight: CGFloat = UIScreen.main.bounds.height / 4
        
        let labelStackView = UIStackView(arrangedSubviews: [profileNameLabel,
                                                            profileYearLabel
                                                           ],
                                         axis: .vertical,
                                         spacing: 5,
                                         distribution: .fillEqually)
        
        addSubview(topBackgroundView)
        NSLayoutConstraint.activate(
            [topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
             topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
             topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
             topBackgroundView.heightAnchor.constraint(equalToConstant: topBackgroundViewHeight)
            ]
        )
        
        topBackgroundView.addSubview(profileImageView)
        NSLayoutConstraint.activate(
            [profileImageView.centerYAnchor.constraint(equalTo: topBackgroundView.centerYAnchor,
                                                       constant: 20),
             profileImageView.leadingAnchor.constraint(equalTo: topBackgroundView.leadingAnchor,
                                                       constant: 25),
             profileImageView.heightAnchor.constraint(equalToConstant: 100),
             profileImageView.widthAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        topBackgroundView.addSubview(labelStackView)
        NSLayoutConstraint.activate(
            [labelStackView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
             labelStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,
                                                     constant: 20)
            ]
        )
        
        addSubview(profileCollectionView)
        NSLayoutConstraint.activate(
            [profileCollectionView.topAnchor.constraint(equalTo: topBackgroundView.bottomAnchor,
                                                        constant: 10),
             profileCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
             profileCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
             profileCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
}
