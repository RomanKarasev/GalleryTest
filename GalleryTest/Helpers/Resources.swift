//
//  Resources.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

enum Resources {
    
    
    //MARK: Images
    static var imagesArray = [UIImage]()
    static var defaultProfileImage =  UIImage(named: "profileImage")
    static var addTabBarImage = UIImage(systemName: "plus")
    static var profileTabBarImage = UIImage(systemName: "person.fill")
    
    //MARK: Size
    
    static var itemSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width / 3 - 2, height: UIScreen.main.bounds.size.width / 3 - 2)

    
    //MARK: Strings
    
    enum String {
        
        static var addTabBarItem = "Add"
        static var profileTabBarItem = "Profile"
        
        static var addPhotoVCTitle = "Add Photo"
        static var profileVCTitle = "Profile"
        static var detailVCTitle = "Detail"
        
        static var emptyLabelText = ""
        
        static var identifier = "ProfileCollectionViewCell"
        
        static var iHaveProfile = "You have an account? - "
        static var dontHaveProfile = "Don’t have an account? - "
        
        static var emailPlaceholder = "Enter Email"
        static var namePlaceholder = "Enter Name"
        static var secondNamePlaceholder = "Enter SecondName"
        static var numberPlaceholder = "Start entering with 7"
        static var passwordPlaceholder = "Enter Password"
        
        static var titleForSignUPButton = "Sign up my Account"
        static var titleForSignINButton = "Sign in my Account"
        static var titleForSigINSmallButton = "SignIN"
        static var titleForSigUPSmallButton = "SignUP"
        static var titleForDateButton = " 01.01.01"
        static var titleForAddPhotoButton = "Choose Photo"
        static var signUpDateLabel = "07.01.1991"
        static var mainAuthLabel = "Wellcome!"
        static var mainSignInLabel = "Wellcome Back!"
        
        static var hiAuthLabel = "Здесь можно зарегистрироваться и выбрать фото профиля"
        static var hiSignInLabel = "Sign in to continue"
        static var hiAddPhotoLabel = "Add new photo to you Profile"
        static var hiDetailLabel = "Photo Info"
        
        
        static var signInCompleted = "SignUp Complete click on SingIN"
        static var signInToContinue = "Sign in to continue"
        
        
        
        enum WrongMessages {
            static var name = "Only a-z or A-z, minimun 1 character"
            static var email = "Email don't valid"
            static var password = "Password is not valid"
            static var number = "Enter 11 number's"
            static var error = "Error"
            static var userNotFound = "User Not Found"
            static var wrongPassword = "Wrong Password"
        }
    }
}
