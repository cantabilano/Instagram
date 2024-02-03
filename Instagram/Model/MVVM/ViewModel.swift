//
//  ViewModel.swift
//  Instagram
//
//  Created by Jason Yang on 2/3/24.
//

import Foundation

protocol UserViewModelDelegate: AnyObject {
    func updateUserName(name: String)
    func updateUserAge(age: Int)
}

class UserViewModel {
    private var user: User  // User 타입의 user 프로퍼티 생성
    weak var delegate: UserViewModelDelegate? // delegate pattern 활용
    
    init(user: User, delegate: UserViewModelDelegate? = nil) {
        self.user = user
        self.delegate = delegate
    }
    
    lazy var userName: String = user.name {
        didSet {
            delegate?.updateUserName(name: userName)
        }
    }
    lazy var userAge: Int = user.age {
        didSet {
            delegate?.updateUserAge(age: userAge)
        }
    }
}
