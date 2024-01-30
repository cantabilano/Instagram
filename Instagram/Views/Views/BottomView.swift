//
//  BottomView.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import UIKit

class BottomView: UIView {

    // MARK: - UI Properties
    var profileButton: UIButton!
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupButton()
        setupLabel()
        BottomViewConstraints(with: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomView {
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 85),
            widthAnchor.constraint(equalToConstant: 375)
        ])
    }
    // MARK: - UIButton Setup
    private func setupButton() {
        profileButton = UIButton()
        if let profileimage = UIImage(named:"Profile") {
            profileButton.setImage(profileimage, for: .normal)
        }
        profileButton.frame = CGRect(x: 0, y: 0, width: 22.5, height: 22.75)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileButton)
    }
    // MARK: - UILabel Setup
    private func setupLabel() {

    }
    
    // MARK: - Constraints
    func BottomViewConstraints(with superView: UIView) {
        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: superView.topAnchor, constant: 18)
//            profileButton.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
//            profileButton.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
            
        ])
    }
}
