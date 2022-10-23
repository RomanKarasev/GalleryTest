//
//  SignInView.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit


//MARK: - SignInView

class SignInView: UIView {
    
    //MARK: Properties
    
    
    //MARK: View
    
    var mainStackView = UIStackView()
    
    //MARK: Label
    
    let mainLabel = UILabel(text: Resources.String.mainSignInLabel,
                            font: .appleSDGothicNeoSemiBold35(),
                            alignment: .center,
                            textColor: .label)
    
    let hiLabel = UILabel(text: Resources.String.hiSignInLabel,
                          font: .appleSDGothicNeo15(),
                          alignment: .center,
                          textColor: .secondaryLabel)
    
    let dontHaveLabel = UILabel(text: Resources.String.dontHaveProfile,
                                font: .appleSDGothicNeo15(),
                                alignment: .center,
                                textColor: .notMainTextColor)
    
    //MARK: TextField
    
    let emailTextField = UITextField(placeholder: Resources.String.emailPlaceholder)
    
    let passwordTextField = UITextField(placeholder: Resources.String.passwordPlaceholder)
    
    //MARK: Buttons
    
    
    let signINButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .mainAccentColor
        button.setTitle(Resources.String.titleForSignINButton, for: .normal)
        button.titleLabel?.textColor = .label
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let signUPButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle(Resources.String.titleForSigUPSmallButton, for: .normal)
        button.clipsToBounds = true
        button.setTitleColor(.notMainTextColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        backgroundColor = .systemBackground
        setTextFields()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTextFields() {
        emailTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
    }
}


//MARK: - setConstraints

extension SignInView {
    
    private func setConstraints() {
        
        mainStackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       passwordTextField
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
        
        addSubview(mainStackView)
        NSLayoutConstraint.activate(
            [mainStackView.topAnchor.constraint(equalTo: topAnchor,
                                                constant: 300),
             mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 37),
             mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                     constant: -37),
             mainStackView.heightAnchor.constraint(equalToConstant: 100)
            ]
        )
        
        addSubview(signINButton)
        NSLayoutConstraint.activate(
            [signINButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor,
                                               constant: 25),
             signINButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 37),
             signINButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                    constant: -37),
             signINButton.heightAnchor.constraint(equalToConstant: 60)
            ]
        )
        
        addSubview(dontHaveLabel)
        NSLayoutConstraint.activate(
            [dontHaveLabel.centerXAnchor.constraint(equalTo: signINButton.centerXAnchor,
                                                    constant: -30),
             dontHaveLabel.topAnchor.constraint(equalTo: signINButton.bottomAnchor,
                                                constant: 10)
            ]
        )
        
        addSubview(signUPButton)
        NSLayoutConstraint.activate(
            [signUPButton.leadingAnchor.constraint(equalTo: dontHaveLabel.trailingAnchor),
             signUPButton.centerYAnchor.constraint(equalTo: dontHaveLabel.centerYAnchor,
                                                   constant: -2),
             signUPButton.heightAnchor.constraint(equalTo: dontHaveLabel.heightAnchor),
             signUPButton.widthAnchor.constraint(equalToConstant: 60)
            ]
        )
    }
}
