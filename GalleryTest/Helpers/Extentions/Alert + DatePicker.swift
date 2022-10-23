//
//  Alert + DatePicker.swift
//  GalleryTest
//
//  Created by Роман Карасёв on 21.10.2022.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {
    
    func alertDate(label: UILabel, button: UIButton, labelAge: UILabel, vericationLabel: UILabel)  {
        
        // MARK: Alert && DatePicker
        
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        
        alert.view.addSubview(datePicker)
        
        // MARK: Ok
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let birthday = datePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateString = dateFormatter.string(from: datePicker.date)
        
            let calendar = NSCalendar.current
            let dateToday = Date()
            
            let age = calendar.dateComponents([.year], from: birthday, to: dateToday)
            let ageYear = age.year
            
            guard let userAge = ageYear else { return }
            
            labelAge.text = "\(userAge)"
            label.text = dateString
            
            if userAge >= 18 {
                button.layer.borderColor = UIColor.green.cgColor
                label.textColor = .label
                vericationLabel.isHidden = true
            } else {
                vericationLabel.isHidden = false
                vericationLabel.text = "Grow UP"
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        //MARK: setView
        
        alert.view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 300).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        
        present(alert, animated: true, completion: nil)
    }
}

