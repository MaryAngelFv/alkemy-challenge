//
//  UIImageView+Extensions.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 11/10/22.
//

import UIKit
import Alamofire

extension UIImageView {
    
    func downloadImage(from path: String) {
        let completePath = "\(NetworkConstants.baseImageUrl)\(path)"
        guard let url = URL(string: completePath) else {
            return
        }
        AF.request(url, method: .get).response{ response in
           switch response.result {
            case .success(let responseData):
               guard let data = responseData,
                     let image = UIImage(data: data) else {
                   return
               }
               DispatchQueue.main.async {
                   self.image = image
               }
            case .failure:
               self.image = nil
            }
        }
    }
}
