//
//  BottomView.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import UIKit

class BottomView: UIView {


    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupButton()
        setupLabel()
        TopViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UIButton Setup
    private func setupButton() {

    }
    // MARK: - UILabel Setup
    private func setupLabel() {

    }
    // MARK: - Constraints
    func TopViewConstraints() {
        NSLayoutConstraint.activate([

        ])
    }
    
}

extension BottomView {
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .cyan
        heightAnchor.constraint(equalToConstant: 85).isActive = true

        
        NSLayoutConstraint.activate([

        ])
    }
}
