//
//  UICollectionView+Extensions.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import UIKit

extension UICollectionView {
    
    func setErrorMessage(_ message: String?) {
        guard let message = message else { return }

        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.sizeToFit()
        backgroundView = messageLabel
    }
    
}
