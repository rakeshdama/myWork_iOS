//
//  ShapesCollectionViewCell.swift
//  L5Starter
//
//  Created by Rakesh Dama  on 18/11/21.
//

import UIKit

class ShapesCollectionViewCell: UICollectionViewCell {
    
    private var shapesImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        shapesImageView.contentMode = .scaleAspectFill
        shapesImageView.clipsToBounds = true
        shapesImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shapesImageView)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            shapesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shapesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shapesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shapesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(for shape: Shape) {
        shapesImageView.image = shape.getImage()
    }
}
