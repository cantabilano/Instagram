//
//  MVVMViewController.swift
//  Instagram
//
//  Created by Jason Yang on 2/3/24.
//

import UIKit
import SnapKit

class MVVMViewController: UIViewController {

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        return label
    }()
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("random age", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(changeAge), for: .touchUpInside)
        return button
    }()

    //viewModel 프로퍼티 생성
    private var viewModel: UserViewModel
    
    //ViewModel 을 뷰에서 사용하기 위해 초기화
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // 인터페이스 빌더를 통해 뷰 컨트롤러가 생성될 때 호출되는 초기화 메소드
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.view.backgroundColor = .white
        self.updateLayout()
        self.nameLabel.text = viewModel.userName
        self.ageLabel.text = String(viewModel.userAge)

        // Do any additional setup after loading the view.
    }
    private func updateLayout() {
        self.view.addSubview(nameLabel)
        self.view.addSubview(ageLabel)
        self.view.addSubview(button)
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(ageLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func changeAge() {
        viewModel.userAge = Int.random(in: 0..<100)
    }
}

extension MVVMViewController: UserViewModelDelegate {
    func updateUserName(name: String) {
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    
    func updateUserAge(age: Int) {
        DispatchQueue.main.async {
            self.ageLabel.text = String(age)
        }
    }
    

}
