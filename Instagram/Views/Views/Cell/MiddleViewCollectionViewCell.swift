//
//  MiddleViewCollectionViewCell.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import UIKit

class MiddleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: MiddleCollectionViewCell.self)
    
    // MARK: - UI Properties
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action Helpers
    
    func configure(with collectionImage: CollectionModel) {
        imageView.image = UIImage(named: collectionImage.imageName)
    }
}

extension MiddleCollectionViewCell {
    private func setupCell() {
        backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 124),
            imageView.heightAnchor.constraint(equalToConstant: 124)
        ])
    }
}
