//
//  DetailInfoTableViewCell.swift
//  alkemy-challenge
//
//  Created by Angelica Ferreira on 12/10/22.
//

import UIKit

struct DetailInfoCellModel {
    let title: String
    let information: String
}

final class DetailInfoTableViewCell: UITableViewCell {
    
    class var identifier: String { return String(describing: self) }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()

    var model: DetailInfoCellModel? {
        didSet {
            titleLabel.text = model?.title
            informationLabel.text = model?.information
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
    
    override func prepareForReuse() {
        titleLabel.text = nil
        informationLabel.text = nil
    }
    
    private func addConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(informationLabel)
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
        
        let informationLabelConstraints = [
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            informationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(informationLabelConstraints)
    }
}
