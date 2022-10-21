//
//  UIString + Ext.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

extension String {
    
    enum ValidTypes {
        case name
        case email
        case password
    }
    
    enum RegularEx: String {
        case name = "[a-zA-z]{1,}"
        case email = "[a-zA-z0-9._-]+@[a-zA-z]+\\.[a-zA-Z]{2,}"
        case password = "(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,}"
    }
    
    func isValid(validTypes: ValidTypes) -> Bool {
        let format = "SELF MATCHES %@"
        var regularEx = ""
        
        switch validTypes {
            case .name:  regularEx = RegularEx.name.rawValue
            case .email: regularEx = RegularEx.email.rawValue
            case .password: regularEx = RegularEx.password.rawValue
        }
        return NSPredicate(format: format, regularEx).evaluate(with: self)
    }
}
