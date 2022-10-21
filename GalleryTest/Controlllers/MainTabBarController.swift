//
//  MainTabBarController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//


import UIKit

// MARK: - MainTabBarController

class MainTabBarController: UITabBarController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    // MARK: Methods
    
    private func setupTabBar() {
        let addPhotoViewController = addPhotoVC()
        let profileViewController =  createProfileVC()
        
        viewControllers = [
            addPhotoViewController,
            profileViewController
        ]
        
        tabBar.tintColor = UIColor(hexString: "#7165E3")
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .systemBackground
        
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0,
                                           height: -1)
        tabBar.layer.shadowRadius = 10
    }
}
// MARK: - Private Methods

extension MainTabBarController {
    
    // MARK: createNavController
    
    private func createNavController(vc: UIViewController, itemName: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName,
                                image: UIImage(),
                                tag: 0
        )
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
    
    // MARK: addPhotoViewController
    
    private func addPhotoVC() -> UINavigationController {
        let VC = createNavController(vc: AddPhotoViewController(), itemName: "Add")
        VC.tabBarItem.image = UIImage(systemName: "plus")
        return VC
    }
    
    // MARK: createProfileVC
    
    private func createProfileVC() -> UINavigationController {
        let VC = createNavController(vc: ProfileViewController(), itemName: "Profile")
        VC.tabBarItem.image = UIImage(systemName: "person.fill")
        return VC
    }
}




