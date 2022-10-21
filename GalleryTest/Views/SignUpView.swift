//
//  SignUpView.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit


//MARK: - SignUpView

class SignUpView: UIView {
    
    //MARK: Properties
    
    
    //MARK: View
    
    let loginBackgroundScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loginBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var mainStackView = UIStackView()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Resources.defaultProfileImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Label
    
    let mainLabel = UILabel(text: Resources.String.mainAuthLabel,
                            font: .appleSDGothicNeoSemiBold35(),
                            alignment: .center,
                            textColor: .label)
    
    let hiLabel = UILabel(text: Resources.String.hiAuthLabel,
                          font: .appleSDGothicNeo15(),
                          alignment: .center,
                          textColor: .secondaryLabel)
    
    let nameVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                        font: .appleSDGothicNeo15(),
                                        alignment: .left,
                                        textColor: .red)
    let secondNameVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                              font: .appleSDGothicNeo15(),
                                              alignment: .left,
                                              textColor: .red)
    
    let dateVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                        font: .appleSDGothicNeo15(),
                                        alignment: .left,
                                        textColor: .red)
    
    let numberVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                          font: .appleSDGothicNeo15(),
                                          alignment: .left,
                                          textColor: .red)
    
    let emailVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                         font: .appleSDGothicNeo15(),
                                         alignment: .left,
                                         textColor: .red)
    
    let passwordVerificationLabel = UILabel(text: Resources.String.emptyLabelText,
                                            font: .appleSDGothicNeo15(),
                                            alignment: .left,
                                            textColor: .red)
    
    let iHaveLabel = UILabel(text: Resources.String.iHaveProfile,
                             font: .appleSDGothicNeo15(),
                             alignment: .center,
                             textColor: .notMainTextColor)
    
    let dateLabel: UILabel = {
        let label = UILabel(text: "07.01.1991",
                            font: .systemFont(ofSize: 17),
                            alignment: .left,
                            textColor: .notMainTextColor)
        label.textColor = #colorLiteral(red: 0.6824527383, green: 0.6743988991, blue: 0.7477797866, alpha: 1)
        return label
    }()
    
    let ageLabel = UILabel(text: Resources.String.emptyLabelText,
                           font: .appleSDGothicNeo15(),
                           alignment: .left,
                           textColor: .label)
    
    //MARK: TextField
    
    let emailTextField = UITextField(placeholder: Resources.String.emailPlaceholder)
    
    let nameTextField = UITextField(placeholder: Resources.String.namePlaceholder)
    
    let secondNameTextField = UITextField(placeholder: Resources.String.secondNamePlaceholder)
    
    let numberTextField = UITextField(placeholder: Resources.String.numberPlaceholder)
    
    let passwordTextField = UITextField(placeholder: Resources.String.passwordPlaceholder)
    
    //MARK: Buttons
    
    let dateButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainBorderColor.cgColor
        button.backgroundColor = .mainBackgroundColorForElement
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signUPButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainAccentColor
        button.setTitle(Resources.String.titleForSignUPButton, for: .normal)
        button.titleLabel?.textColor = .label
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let imageButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainBorderColor.cgColor
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let signINButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(Resources.String.titleForSigINSmallButton, for: .normal)
        button.clipsToBounds = true
        button.setTitleColor(.notMainTextColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        hideVerificationLabel()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideVerificationLabel() {
        nameVerificationLabel.isHidden = true
        secondNameVerificationLabel.isHidden = true
        dateVerificationLabel.isHidden = true
        numberVerificationLabel.isHidden = true
        emailVerificationLabel.isHidden = true
        passwordVerificationLabel.isHidden = true
    }
}

//MARK: - setConstraints

extension SignUpView {
    
    private func setConstraints() {
        
        mainStackView = UIStackView(arrangedSubviews: [nameTextField,
                                                       nameVerificationLabel,
                                                       secondNameTextField,
                                                       secondNameVerificationLabel,
                                                       dateButton,
                                                       dateVerificationLabel,
                                                       numberTextField,
                                                       numberVerificationLabel,
                                                       emailTextField,
                                                       emailVerificationLabel,
                                                       passwordTextField,
                                                       passwordVerificationLabel
                                                      ],
                                    axis: .vertical,
                                    spacing: 10,
                                    distribution: .fillProportionally)
        
        
        addSubview(mainLabel)
        NSLayoutConstraint.activate(
            [mainLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 113),
             mainLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
        
        addSubview(hiLabel)
        NSLayoutConstraint.activate(
            [hiLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor,
                                          constant: 10),
             hiLabel.centerXAnchor.constraint(equalTo: mainLabel.centerXAnchor)
            ]
        )
        
        addSubview(loginBackgroundScrollView)
        NSLayoutConstraint.activate(
            [loginBackgroundScrollView.topAnchor.constraint(equalTo: hiLabel.bottomAnchor,
                                                            constant: 10),
             loginBackgroundScrollView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                                constant: 37),
             loginBackgroundScrollView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                                 constant: -37),
             loginBackgroundScrollView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                               constant: -300)
            ]
        )
        
        loginBackgroundScrollView.addSubview(loginBackgroundView)
        NSLayoutConstraint.activate(
            [loginBackgroundView.centerXAnchor.constraint(equalTo: loginBackgroundScrollView.centerXAnchor),
             loginBackgroundView.centerYAnchor.constraint(equalTo: loginBackgroundScrollView.centerYAnchor),
             loginBackgroundView.heightAnchor.constraint(equalTo: loginBackgroundScrollView.heightAnchor),
             loginBackgroundView.widthAnchor.constraint(equalTo: loginBackgroundScrollView.widthAnchor)
            ]
        )
        
        loginBackgroundView.addSubview(imageButton)
        NSLayoutConstraint.activate(
            [imageButton.topAnchor.constraint(equalTo: loginBackgroundView.topAnchor,
                                              constant: 10),
             imageButton.centerXAnchor.constraint(equalTo: centerXAnchor),
             imageButton.heightAnchor.constraint(equalToConstant: 100),
             imageButton.widthAnchor.constraint(equalToConstant: 100)
            ]
        )

        imageButton.addSubview(profileImageView)
        NSLayoutConstraint.activate(
            [profileImageView.topAnchor.constraint(equalTo: imageButton.topAnchor),
             profileImageView.leadingAnchor.constraint(equalTo: imageButton.leadingAnchor),
             profileImageView.trailingAnchor.constraint(equalTo: imageButton.trailingAnchor),
             profileImageView.bottomAnchor.constraint(equalTo: imageButton.bottomAnchor)
            ]
        )

        loginBackgroundView.addSubview(mainStackView)
        NSLayoutConstraint.activate(
            [mainStackView.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: 10),
             mainStackView.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor),
             mainStackView.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor),
             mainStackView.bottomAnchor.constraint(equalTo: loginBackgroundView.bottomAnchor)
            ]
        )

        dateButton.addSubview(dateLabel)
        NSLayoutConstraint.activate([dateLabel.topAnchor.constraint(equalTo: dateButton.topAnchor),
                                     dateLabel.leadingAnchor.constraint(equalTo: dateButton.leadingAnchor, constant: 7),
                                     dateLabel.trailingAnchor.constraint(equalTo: dateButton.trailingAnchor, constant: -7),
                                     dateLabel.bottomAnchor.constraint(equalTo: dateButton.bottomAnchor)
                                    ])
        
        addSubview(signUPButton)
        NSLayoutConstraint.activate(
            [signUPButton.topAnchor.constraint(equalTo: loginBackgroundScrollView.bottomAnchor,
                                               constant: 10),
             signUPButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 37),
             signUPButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -37),
             signUPButton.heightAnchor.constraint(equalToConstant: 60)
            ]
        )

        addSubview(iHaveLabel)
        NSLayoutConstraint.activate(
            [iHaveLabel.centerXAnchor.constraint(equalTo: signUPButton.centerXAnchor,
                                                 constant: -30),
             iHaveLabel.topAnchor.constraint(equalTo: signUPButton.bottomAnchor,
                                             constant: 10)
            ]
        )

        addSubview(signINButton)
        NSLayoutConstraint.activate(
            [signINButton.leadingAnchor.constraint(equalTo: iHaveLabel.trailingAnchor),
             signINButton.centerYAnchor.constraint(equalTo: iHaveLabel.centerYAnchor,
                                                   constant: -2),
             signINButton.heightAnchor.constraint(equalTo: iHaveLabel.heightAnchor),
             signINButton.widthAnchor.constraint(equalToConstant: 60)
            ]
        )
    }
}
