//
//  DetailView.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//


import UIKit

//MARK: - DetailView

class DetailView: UIView {
    
    //MARK: Properties
    
    //MARK: View
    
    let topBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainAccentColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    let chosenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = Resources.defaultProfileImage
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    //MARK: Label
    
    let hiLabel = UILabel(text: Resources.String.hiDetailLabel,
                          font: .appleSDGothicNeo15(),
                          alignment: .center,
                          textColor: .secondaryLabel)
    
    let nameLabel = UILabel(text: Resources.String.emptyLabelText,
                            font: .appleSDGothicNeo20(),
                            alignment: .center,
                            textColor: .label)
    let secondNameLabel = UILabel(text: Resources.String.emptyLabelText,
                                  font: .appleSDGothicNeo20(),
                                  alignment: .center,
                                  textColor: .label)
    
    let dateLabel = UILabel(text: Resources.String.emptyLabelText,
                            font: .appleSDGothicNeo15(),
                            alignment: .center,
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

extension DetailView {
    
    private func setConstraints() {
        
        let topBackgroundViewHeight: CGFloat = UIScreen.main.bounds.height / 4
        
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel,
                                                            secondNameLabel
                                                           ],
                                         axis: .vertical,
                                         spacing: 5,
                                         distribution: .fillEqually)
        
        addSubview(hiLabel)
        NSLayoutConstraint.activate(
            [hiLabel.topAnchor.constraint(equalTo: topAnchor,
                                          constant: 150),
             hiLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
        
        addSubview(topBackgroundView)
        NSLayoutConstraint.activate(
            [topBackgroundView.topAnchor.constraint(equalTo: topAnchor,
                                                    constant: -20),
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
        
        addSubview(chosenImageView)
        NSLayoutConstraint.activate(
            [chosenImageView.topAnchor.constraint(equalTo: topAnchor,
                                                  constant: 300),
             chosenImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 37),
             chosenImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -37),
             chosenImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                     constant: -250)
            ]
        )
        
        addSubview(dateLabel)
        NSLayoutConstraint.activate(
            [dateLabel.bottomAnchor.constraint(equalTo: chosenImageView.topAnchor,
                                               constant: -5),
             dateLabel.centerXAnchor.constraint(equalTo: chosenImageView.centerXAnchor)
            ]
        )
    }
}



