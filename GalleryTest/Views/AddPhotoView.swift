//
//  AddPhotoView.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit


//MARK: - AddPhotoView

class AddPhotoView: UIView {
    
    //MARK: Properties
    
    
    //MARK: View
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .secondarySystemBackground
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Label
    
    let hiLabel = UILabel(text: Resources.String.hiAddPhotoLabel,
                          font: .appleSDGothicNeo15(),
                          alignment: .center,
                          textColor: .secondaryLabel)
    
    //MARK: Buttons
    
    
    let addPhotoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainAccentColor
        button.setTitle(Resources.String.titleForAddPhotoButton, for: .normal)
        button.titleLabel?.textColor = .label
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
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

extension AddPhotoView {
    
    private func setConstraints() {
        
        addSubview(hiLabel)
        NSLayoutConstraint.activate(
            [hiLabel.topAnchor.constraint(equalTo: topAnchor,
                                          constant: 150),
             hiLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
        
        addSubview(imageView)
        NSLayoutConstraint.activate(
            [imageView.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 200),
             imageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 37),
             imageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -37),
             imageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -350)
            ]
        )
        
        
        addSubview(addPhotoButton)
        NSLayoutConstraint.activate(
            [addPhotoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor,
                                                 constant: 25),
             addPhotoButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 37),
             addPhotoButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -37),
             addPhotoButton.heightAnchor.constraint(equalToConstant: 60)
            ]
        )
    }
}


