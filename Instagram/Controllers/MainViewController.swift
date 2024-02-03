//
//  ViewController.swift
//  Instagram
//
//  Created by Jason Yang on 1/26/24.
//

import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController  {

    // MARK: - UI Properties
    private lazy var buttonProfile: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ProfileDesignViewController", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var MVVMButton: UIButton = {
        let button = UIButton()
        button.setTitle("MVVM", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupUI()

    }

    // MARK: - UI Setup
    private func addSubViews() {
        view.addSubview(buttonProfile)
        view.addSubview(MVVMButton)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        buttonProfile.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        MVVMButton.addTarget(self, action: #selector(touchMVVMButton), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            buttonProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            MVVMButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            MVVMButton.topAnchor.constraint(equalTo: buttonProfile.bottomAnchor)
        ])
    }


    // MARK: - @objc
    @objc private func tappedButton() {
        print("tappedbutton()")
        let profileDesignView = ProfileDesignViewController()
//profileDesignView.modalPresentationStyle = .fullScreen
        present(profileDesignView, animated: true)
    }
    @objc private func touchMVVMButton() {
        let user = User(name: "양준현", age: 100)
        let viewModel = UserViewModel(user: user)
        let mVVMViewController = MVVMViewController(viewModel: viewModel)
        present(mVVMViewController, animated: true)
    }
}


// MARK: - Preview
struct PreView: PreviewProvider {
    static var previews: some View {
        MainViewController().toPreview()
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

