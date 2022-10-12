//
//  PopularMovieCollectionViewCell.swift
//  alkemy-challenge
//
//  Created by Brayam Mora on 10/10/22.
//

import UIKit

class PopularMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var posterImageView: UIImageView!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    var model: Movie? {
        didSet {
            if let posterUrl = model?.posterPath {
                posterImageView.downloadImage(from: posterUrl)
            }
            nameLabel.text = model?.name
        }
    }
    
    override func prepareForReuse() {
        nameLabel.text = nil
        posterImageView.image = nil
    }
}
