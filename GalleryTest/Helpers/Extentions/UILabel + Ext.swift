//
//  UILabel + Ext.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

