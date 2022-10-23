//
//  DetailViewController.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

//MARK: - DetailViewController

class DetailViewController: UIViewController {
    
    // MARK: Properties
    
    let detailView = DetailView()
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setModel()
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    func setModel() {
        guard let activeUser = UserData.shared.selectedUserWithPhoto else { return }
        
        detailView.profileImageView.image = UIImage(data: activeUser.profileImage)
        detailView.nameLabel.text = activeUser.name
        detailView.dateLabel.text = activeUser.dateNow
        detailView.secondNameLabel.text = activeUser.secondName
        
        guard let imageData = activeUser.profilePhoto else { return }
        guard let image = UIImage(data: imageData) else { return }
        detailView.chosenImageView.image = image
    }
}
