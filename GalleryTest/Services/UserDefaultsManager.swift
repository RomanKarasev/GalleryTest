//
//  UserDefaultsManager.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import Foundation

//MARK: - UserData

class UserData {
    
    static let shared = UserData()
    
    enum Keys: String {
        case users
        case selectedUser
    }
    
    let defaults = UserDefaults.standard
    let userKey = Keys.users.rawValue
    let selectedUserKey = Keys.selectedUser.rawValue
    
    
    //MARK: users
    
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
    
    
    //MARK: saveData
    
    func saveData(name: String, secondName: String, date: String, dateNow: String,  age: String, number: String, email: String, password: String, profileImage: Data, profilePhoto: Data) {
        
        let user = User(name: name,
                        secondName: secondName,
                        date: date,
                        age: age,
                        dateNow: "",
                        number: number,
                        email: email,
                        password: password,
                        profileImage: profileImage,
                        profilePhoto: profilePhoto
        )
        users.insert(user, at: 0)
    }
    
    func saveActiveUser(user: User) {
        selectedUser = user
    }
    
    func saveDateToUser(user: User, dateNow: String)  {
        selectedUserWithPhoto = user
        selectedUser?.dateNow = dateNow
    }
    
    func savePhotoToUser(user: User, profilePhoto: Data)  {
        selectedUserWithPhoto = user
        selectedUser?.profilePhoto = profilePhoto
    }
}
