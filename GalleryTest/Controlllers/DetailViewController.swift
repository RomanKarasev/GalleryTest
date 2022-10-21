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
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}




