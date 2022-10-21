//
//  UIColor + Ext.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    static let mainAccentColor = UIColor(hexString: "#7165E3")
    static let mainBorderColor = UIColor(hexString: "#2C2948")
    static let mainBackgroundColorForElement = UIColor(hexString: "#E3E0F9")
    static let notMainTextColor = UIColor(hexString: "#1C1939")
    static let colorForTitleDateButton =  UIColor(hexString: "#B8B6CB")
    
    
    
    
    static let segmentedBackgroundColor = UIColor.systemGroupedBackground
    static let tabBarBackgroundColor = UIColor.systemGroupedBackground
    
    static let mainColor = UIColor.systemBlue
    static let accentColor = UIColor.systemOrange
    static let clearColor = UIColor.clear
    static let shadowColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 0.5)
    
    static let mainTextColor = UIColor.label
    static let titleForButtonsWithBackground = UIColor.white
}



