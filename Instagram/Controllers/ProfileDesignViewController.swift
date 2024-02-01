//
//  ProfileDesignViewController.swift
//  Instagram
//
//  Created by Jason Yang on 1/26/24.
//

import UIKit
import SwiftUI
//DataManager로 코어데이터를 적용하자. 

final class ProfileDesignViewController: UITabBarController {
    
    // MARK: - UI Properties
    private lazy var stackView: UIStackView = { createStackView() }()
    
    private let topView = TopView()
    private let middleView = MiddleView()
//    private let bottomView = BottomView()
    
    var profileButton: UIButton!
    var userName: UILabel!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setLayout()
        setupButton()
        setupLabel()
        profileDesignViewConstraints()
        
    }
}

extension ProfileDesignViewController {
    private func setupUI() {
        view.backgroundColor = .white

        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        middleView.translatesAutoresizingMaskIntoConstraints = false
//        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        // 스택뷰의 bottomView를 tabBarItem으로 대체
        let profileViewController = ProfileViewController()
        let profileViewNavigationController = UINavigationController(rootViewController: profileViewController)
        profileViewNavigationController.tabBarItem = UITabBarItem(title: "profile", image: UIImage(named: "Profile"), selectedImage: UIImage(named: "Profile") )
        self.tabBar.tintColor = .black
        viewControllers = [profileViewNavigationController]
        
    }
    
    private func setLayout() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        [topView, middleView].forEach { stackView.addArrangedSubview($0) } //bottomView
        return stackView
    }
    
    // MARK: - UIButton Setup
    private func setupButton() {
        profileButton = UIButton(type: .system)
        if let image = UIImage(systemName: "list.dash") {
            profileButton.setImage(image, for: .normal)
        }
        profileButton.tintColor = .black
        profileButton.backgroundColor = .white
        profileButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
    }
    // MARK: - UILabel Setup
    private func setupLabel() {

    }
    
    // MARK: - @objc
    @objc private func menuButtonTapped() {
        print("menuTapped")
        showMyViewControllerInACustomizedSheet()
//        let menuViewController = MenuViewController()
//        present(menuViewController, animated: true)
        
    }
    // MARK: - Constraints
    func profileDesignViewConstraints() {
        NSLayoutConstraint.activate([
            profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338),
            profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            profileButton.widthAnchor.constraint(equalToConstant: 21),
            profileButton.heightAnchor.constraint(equalToConstant: 17.5),
        ])
    }
}

extension ProfileDesignViewController {
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = ProfileViewController()
        if let sheet = viewControllerToPresent.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
}
