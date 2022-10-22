//
//  UserDefaultsManager.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import Foundation

class UserData {
    
    static let shared = UserData()
    
    enum Keys: String {
        case users
        case selectedUser
    }
    
    let defaults = UserDefaults.standard
    let userKey = Keys.users.rawValue
    let selectedUserKey = Keys.selectedUser.rawValue
    
    var users: [User] {
        get {
            if let data = defaults.value(forKey: userKey) as? Data {
                return try! PropertyListDecoder().decode([User].self, from: data)
            } else {
                return [User]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: userKey)
            }
        }
    }
    
    func saveData(name: String, secondName: String, date: String, age: String, number: String, email: String, password: String, profileImage: Data, profilePhoto: Data?) {
        
        let user = User(name: name,
                        secondName: secondName,
                        date: date,
                        age: age,
                        number: number,
                        email: email,
                        password: password,
                        profileImage: profileImage,
                        profilePhoto: profilePhoto
        )
        users.insert(user, at: 0)
    }
    
    var selectedUser: User? {
        get {
            if let data = defaults.value(forKey: selectedUserKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            } else {
                return nil
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: selectedUserKey)
            }
        }
    }
    
    func saveActiveUser(user: User) {
        selectedUser = user
    }
    
    var selectedUserWithPhoto: User? {
        get {
            if let data = defaults.value(forKey: selectedUserKey) as? Data {
                return try! PropertyListDecoder().decode(User.self, from: data)
            } else {
                return nil
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: selectedUserKey)
            }
        }
    }
    
    func savePhotoToUser(user: User, profilePhoto: Data)  {
        selectedUserWithPhoto = user
        selectedUser?.profilePhoto = profilePhoto
    }
    
    
    
}
