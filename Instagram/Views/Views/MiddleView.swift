//
//  MiddleView.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

protocol MiddleViewDelegate: AnyObject {
    func didTappedCollectionViewCell()
}

import UIKit

class MiddleView: UIView, UICollectionViewDelegate {
    //    weak var delegate: MiddleViewDelegate?
    weak var middleViewdelegate: MiddleViewDelegate?
    
    // MARK: - UI Properties
    var dataSource: [CollectionModel] = []
    var collectionViewImages: [CollectionModel] = [
        CollectionModel(id: 0, name: "image0", imageName: "picture 0"),
        CollectionModel(id: 1, name: "image1", imageName: "picture 1"),
        CollectionModel(id: 2, name: "image2", imageName: "picture 2"),
        CollectionModel(id: 3, name: "image3", imageName: "picture 3"),
        CollectionModel(id: 4, name: "image4", imageName: "picture 4"),
        CollectionModel(id: 5, name: "image5", imageName: "picture 5"),
        CollectionModel(id: 6, name: "image6", imageName: "picture 6"),
        CollectionModel(id: 7, name: "image7", imageName: "picture 7"),
        CollectionModel(id: 8, name: "image0", imageName: "picture 0"),
        CollectionModel(id: 9, name: "image1", imageName: "picture 1"),
        CollectionModel(id: 10, name: "image2", imageName: "picture 2"),
        CollectionModel(id: 11, name: "image3", imageName: "picture 3"),
        CollectionModel(id: 12, name: "image4", imageName: "picture 4"),
        CollectionModel(id: 13, name: "image5", imageName: "picture 5"),
        CollectionModel(id: 14, name: "image6", imageName: "picture 6"),
        CollectionModel(id: 15, name: "image7", imageName: "picture 7")
    ]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical  // 스크롤 방향을 수평으로 설정
        // 셀 아이템의 크기를 버퍼(-4)를 제외하고 3으로 나눈 값 = 3개의 뷰를 나타낼 수 있다. 
        let itemSizeWidthHeight = (UIScreen.main.bounds.width - 4) / 3
        layout.itemSize = CGSize(width: itemSizeWidthHeight, height: itemSizeWidthHeight)
        // collectionView를 선언할 때 선의 간격(LineSpacing)과 셀 간격(minimumInteritemSpacing)을 설정할 수 있다.
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MiddleCollectionViewCell.self, forCellWithReuseIdentifier: MiddleCollectionViewCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dataSource = collectionViewImages
        collectionView.reloadData()
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MiddleView {
    private func setUI() {
        backgroundColor = .white
        
        addSubview(collectionView)
        
        heightAnchor.constraint(equalToConstant: 380).isActive = true
        widthAnchor.constraint(equalToConstant: 425).isActive = true
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}


// MARK: - UICollectionViewDataSource
extension MiddleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MiddleCollectionViewCell.identifier, for: indexPath) as? MiddleCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let collectionImage = dataSource[indexPath.row]
        cell.configure(with: collectionImage)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
//extension MiddleView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 124, height: 124)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
    
//}

