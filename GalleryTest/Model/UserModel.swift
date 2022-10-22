//
//  UserModel.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import Foundation

struct User: Codable {
    let name: String
    let secondName: String
    let date: String
    let age: String
    let number: String
    let email: String
    let password: String
    let profileImage: Data
    var profilePhoto: Data?
}



