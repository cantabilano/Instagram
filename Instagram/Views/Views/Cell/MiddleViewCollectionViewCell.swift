//
//  MiddleViewCollectionViewCell.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import UIKit

class MiddleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MiddleCollectionViewCell {
    private func setupCell() {
        backgroundColor = .blue
    }
}
