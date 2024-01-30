//
//  ViewController.swift
//  Instagram
//
//  Created by Jason Yang on 1/26/24.
//

import UIKit
import SwiftUI

class MainViewController: UIViewController {
    

    // MARK: - UI Properties
    private let buttonProfile: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ProfileDesignViewController", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(buttonProfile)
        buttonProfile.addTarget(self, action: #selector(tappedbutton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonProfile.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - @objc
    @objc private func tappedbutton() {
        print("tappedbutton()")
        let profileDesignView = ProfileDesignViewController()
        present(profileDesignView, animated: true)
    }
}




