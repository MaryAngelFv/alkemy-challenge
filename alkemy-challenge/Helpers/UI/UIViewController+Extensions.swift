//
//  UIViewController+Extensions.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarColor() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}
