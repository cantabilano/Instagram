//
//  MiddleView.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

protocol MiddleViewDelegate: AnyObject {
    func menuButtonTapped()
}

import UIKit

class MiddleView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var delegate: MiddleViewDelegate?
    // MARK: - UI Properties
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MiddleCollectionViewCell.self, forCellWithReuseIdentifier: MiddleCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleCollectionViewCell.identifier, for: indexPath) as? MiddleCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MiddleView {
    private func setUI() {
        backgroundColor = .lightGray
        
        heightAnchor.constraint(equalToConstant: 380).isActive = true
        widthAnchor.constraint(equalToConstant: 425).isActive = true
    }
}
