//
//  UITextField + Ext.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init()
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.tintColor = .label
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hexString: "#2C2948").cgColor
        self.backgroundColor = UIColor(hexString: "#E3E0F9")
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
