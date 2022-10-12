//
//  DetailImageTableViewCell.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import UIKit

struct DetailImageCellModel {
    let posterPath: String
}

final class DetailImageTableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var model: DetailImageCellModel? {
        didSet {
            if let posterUrl = model?.posterPath {
                posterImageView.downloadImage(from: posterUrl)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        contentView.addSubview(posterImageView)
        let posterImageViewConstraints = [
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 250)
        ]
        NSLayoutConstraint.activate(posterImageViewConstraints)
    }
}
