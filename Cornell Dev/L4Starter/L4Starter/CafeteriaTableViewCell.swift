//
//  CafeteriaTableViewCell.swift
//  L4Starter
//
//  Created by Rakesh Dama  on 17/11/21.
//  Copyright © 2021 Yana Sang. All rights reserved.
//

import UIKit

class CafeteriaTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var ratingLabel = UILabel()
    var heartImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        ratingLabel.font = .systemFont(ofSize: 12)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingLabel)
        
        heartImageView.image = UIImage(named: "heart")
        heartImageView.clipsToBounds = true
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(heartImageView)
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for cafeteria: Cafeteria) {
        nameLabel.text = cafeteria.name
        ratingLabel.text = "Rating: \(cafeteria.getRatingString())"
        heartImageView.isHidden = cafeteria.isFavorite
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            heartImageView.heightAnchor.constraint(equalToConstant: 16),
            heartImageView.widthAnchor.constraint(equalToConstant: 16),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func toggle(isFavorite: Bool) {
        heartImageView.isHidden = !isFavorite
    }
    
}

