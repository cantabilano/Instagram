//
//  ProfileDesignViewController.swift
//  Instagram
//
//  Created by Jason Yang on 1/26/24.
//

import UIKit
import SwiftUI
//DataManager로 코어데이터를 적용하자. 

final class ProfileDesignViewController: UIViewController{
    
    // MARK: - UI Properties
    private lazy var stackView: UIStackView = { createStackView() }()
    
    private let topView = TopView()
    private let middleView = MiddleView()
    private let bottomView = BottomView()
    
    var menuButton: UIButton!
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
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setLayout() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func createStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        [topView, middleView, bottomView].forEach { stackView.addArrangedSubview($0) }
        return stackView
    }
    
    // MARK: - UIButton Setup
    private func setupButton() {
        menuButton = UIButton(type: .system)
        if let image = UIImage(systemName: "list.dash") {
            menuButton.setImage(image, for: .normal)
        }
        menuButton.tintColor = .black
        menuButton.backgroundColor = .white
        menuButton.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
    }
    // MARK: - UILabel Setup
    private func setupLabel() {
        userName = UILabel()
        userName.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = UIFont(name: "OpenSans-Bold", size: 18)
        userName.textAlignment = .center
        userName.attributedText = NSMutableAttributedString(string: "nabaecamp", attributes: [NSAttributedString.Key.kern: -1])
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
    }
    
    // MARK: - @objc
    @objc private func menuButtonTapped() {
        print("menuTapped")
        let profileViewController = ProfileViewController()
        present(profileViewController, animated: true)
    }
    // MARK: - Constraints
    func profileDesignViewConstraints() {
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 338),
            menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 58),
            menuButton.widthAnchor.constraint(equalToConstant: 21),
            menuButton.heightAnchor.constraint(equalToConstant: 17.5),
            
            userName.widthAnchor.constraint(equalToConstant: 97),
            userName.heightAnchor.constraint(equalToConstant: 25),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 139),
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 54)
        ])
    }
}

// MARK: - Preview
struct PreView: PreviewProvider {
    static var previews: some View {
        ProfileDesignViewController().toPreview()
    }
}

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif
