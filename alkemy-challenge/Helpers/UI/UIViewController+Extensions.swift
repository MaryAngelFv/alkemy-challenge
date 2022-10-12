//
//  UIViewController+Extensions.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 12/10/22.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarColor() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}
