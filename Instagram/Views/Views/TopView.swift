//
//  TopView.swift
//  Instagram
//
//  Created by Jason Yang on 1/30/24.
//

import UIKit

class TopView: UIView {
    //    weak var delegate: TopViewDelegate?
    weak var controller: UIViewController?
    
    var userName: UILabel!
    var profileImageView = UIImageView()
    
    var followButton: UIButton!
    var messageButton: UIButton!
    var moreButton: UIButton!
    
    var postNumber: UILabel!
    var followerNumber: UILabel!
    var follwingNumber: UILabel!
    
    var postLabel: UILabel!
    var followLabel: UILabel!
    var followingLabel: UILabel!
    
    var profileName: UILabel!
    var profileDescription: UILabel!
    var profileAddress: UILabel!
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupButton()
        setupLabel()
        topViewConstraints(with: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIButton Setup
    private func setupButton() {
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.image = UIImage(named: "logged-in-rtan")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileImageView)
        
        followButton = UIButton(type: .system)
        followButton.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        followButton.layer.backgroundColor = UIColor(red: 0.22, green: 0.596, blue: 0.953, alpha: 1).cgColor
        followButton.layer.cornerRadius = 4
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.white, for: .normal)
        followButton.addTarget(self, action: #selector(followTapped), for: .touchUpInside)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followButton)
        
        messageButton = UIButton(type: .system)
        messageButton.frame = CGRect(x: 0, y: 0, width: 150, height: 30)
        messageButton.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        messageButton.layer.cornerRadius = 4
        messageButton.layer.borderWidth = 1.5
        messageButton.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        messageButton.setTitle("Message", for: .normal)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.addTarget(self, action: #selector(messageTapped), for: .touchUpInside)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(messageButton)
        
        moreButton = UIButton(type: .custom)
        if let vimage = UIImage(named: "More") {
            moreButton.setImage(vimage, for: .normal)
        }
        moreButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        moreButton.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(moreButton)
    }
    
    // MARK: - UILabel Setup
    private func setupLabel() {
        
        postNumber = UILabel()
        postNumber.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        postNumber.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        postNumber.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        postNumber.textAlignment = .center
        postNumber.translatesAutoresizingMaskIntoConstraints = false
        postNumber.text = "7"
        self.addSubview(postNumber)
        
        followerNumber = UILabel()
        followerNumber.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        followerNumber.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followerNumber.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        followerNumber.translatesAutoresizingMaskIntoConstraints = false
        followerNumber.textAlignment = .center
        followerNumber.text = "1"
        self.addSubview(followerNumber)
        
        follwingNumber = UILabel()
        follwingNumber.frame = CGRect(x: 0, y: 0, width: 10, height: 22)
        follwingNumber.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        follwingNumber.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        follwingNumber.textAlignment = .center
        follwingNumber.text = "2"
        follwingNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(follwingNumber)
        
        postLabel = UILabel()
        postLabel.frame = CGRect(x: 0, y: 0, width: 28, height: 19)
        postLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        postLabel.font = UIFont(name: "OpenSans-Regular", size: 14)
        postLabel.textAlignment = .center
        postLabel.attributedText = NSMutableAttributedString(string: "post", attributes: [NSAttributedString.Key.kern: -0.3])
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(postLabel)
        
        followLabel = UILabel()
        followLabel.frame = CGRect(x: 0, y: 0, width: 51, height: 19)
        followLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followLabel.font = UIFont(name: "OpenSans-Regular", size: 14)
        followLabel.textAlignment = .center
        followLabel.attributedText = NSMutableAttributedString(string: "follower", attributes: [NSAttributedString.Key.kern: -0.3])
        followLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followLabel)
        
        followingLabel = UILabel()
        followingLabel.frame = CGRect(x: 0, y: 0, width: 57, height: 19)
        followingLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        followingLabel.font = UIFont(name: "OpenSans-Regular", size: 14)
        followingLabel.textAlignment = .center
        followingLabel.attributedText = NSMutableAttributedString(string: "following", attributes: [NSAttributedString.Key.kern: -0.3])
        followingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(followingLabel)
        
        
        userName = UILabel()
        userName.frame = CGRect(x: 0, y: 0, width: 97, height: 25)
        userName.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        userName.font = UIFont(name: "OpenSans-Bold", size: 18)
        userName.attributedText = NSMutableAttributedString(string: "nabaecamp", attributes: [NSAttributedString.Key.kern: -1])
        userName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userName)
        
        profileName = UILabel()
        profileName.frame = CGRect(x: 0, y: 0, width: 200, height: 19)
        profileName.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        profileName.font = UIFont(name: "OpenSans-Bold", size: 14)
        profileName.attributedText = NSMutableAttributedString(string: "르탄이", attributes: [NSAttributedString.Key.kern: -0.5])
        profileName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileName)
        
        profileDescription = UILabel()
        profileDescription.frame = CGRect(x: 0, y: 0, width: 345, height: 19)
        profileDescription.textColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        profileDescription.font = UIFont(name: "OpenSans-Regular", size: 14)
        profileDescription.attributedText = NSMutableAttributedString(string: "iOS Developer 🍎", attributes: [NSAttributedString.Key.kern: -0.5])
        profileDescription.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileDescription)
        
        profileAddress = UILabel()
        profileAddress.frame = CGRect(x: 0, y: 0, width: 121, height: 19)
        profileAddress.textColor = UIColor(red: 0.061, green: 0.274, blue: 0.492, alpha: 1)
        profileAddress.font = UIFont(name: "OpenSans-Regular", size: 14)
        profileAddress.attributedText = NSMutableAttributedString(string: "spartacodingclub.kr", attributes: [NSAttributedString.Key.kern: -0.5])
        profileAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileAddress)
    }
    // MARK: - @objc
    @objc private func followTapped() {
        
    }
    
    @objc private func messageTapped() {
        
    }
    // MARK: - Constraints
    func topViewConstraints(with superView: UIView) {
        
        NSLayoutConstraint.activate([
            //MARK: - Top bar Constraints
            postNumber.widthAnchor.constraint(equalToConstant: 10),
            postNumber.heightAnchor.constraint(equalToConstant: 22),
            postNumber.topAnchor.constraint(equalTo: superView.topAnchor, constant: 116),
            postNumber.trailingAnchor.constraint(equalTo: followerNumber.leadingAnchor, constant: -70),
            
            followerNumber.widthAnchor.constraint(equalToConstant: 10),
            followerNumber.heightAnchor.constraint(equalToConstant: 22),
            followerNumber.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 232),
            followerNumber.topAnchor.constraint(equalTo: superView.topAnchor, constant: 116),
            
            follwingNumber.widthAnchor.constraint(equalToConstant: 10),
            follwingNumber.heightAnchor.constraint(equalToConstant: 22),
            follwingNumber.topAnchor.constraint(equalTo: superView.topAnchor, constant: 116),
            follwingNumber.leadingAnchor.constraint(equalTo: followerNumber.trailingAnchor, constant: 72),
            
//            var postLabel: UILabel!
//            var followLabel: UILabel!
//            var followingLabel: UILabel!
            
            postLabel.widthAnchor.constraint(equalToConstant: 28),
            postLabel.heightAnchor.constraint(equalToConstant: 19),
            postLabel.topAnchor.constraint(equalTo: postNumber.bottomAnchor),
            postLabel.trailingAnchor.constraint(equalTo: followLabel.leadingAnchor, constant: -42),
            
            followLabel.widthAnchor.constraint(equalToConstant: 51),
            followLabel.heightAnchor.constraint(equalToConstant: 19),
            followLabel.topAnchor.constraint(equalTo: followerNumber.bottomAnchor),
            followLabel.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 232),
            
            followingLabel.widthAnchor.constraint(equalToConstant: 57),
            followingLabel.heightAnchor.constraint(equalToConstant: 19),
            followingLabel.topAnchor.constraint(equalTo: follwingNumber.bottomAnchor),
            followingLabel.leadingAnchor.constraint(equalTo: followLabel.trailingAnchor, constant: 26),
            
            userName.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            userName.topAnchor.constraint(equalTo: superView.topAnchor, constant: 54),
            userName.widthAnchor.constraint(equalToConstant: 97),
            userName.heightAnchor.constraint(equalToConstant: 25),
            
            followButton.widthAnchor.constraint(equalToConstant: 150),
            followButton.heightAnchor.constraint(equalToConstant: 30),
            //            followButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            //            followButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            followButton.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
            followButton.topAnchor.constraint(equalTo: superView.topAnchor, constant: 265),
            
            messageButton.widthAnchor.constraint(equalToConstant: 150),
            messageButton.heightAnchor.constraint(equalToConstant: 30),
            //            messageButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            //            messageButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            messageButton.leadingAnchor.constraint(equalTo: followButton.trailingAnchor, constant: 8),
            messageButton.topAnchor.constraint(equalTo: superView.topAnchor, constant: 265),
            
            moreButton.widthAnchor.constraint(equalToConstant: 30),
            moreButton.heightAnchor.constraint(equalToConstant: 30),
            moreButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 8),
            moreButton.topAnchor.constraint(equalTo: superView.topAnchor, constant: 265),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 88),
            profileImageView.heightAnchor.constraint(equalToConstant: 88),
            profileImageView.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 14),
            profileImageView.topAnchor.constraint(equalTo: superView.topAnchor, constant: 93),
            
            profileName.widthAnchor.constraint(equalToConstant: 200),
            profileName.heightAnchor.constraint(equalToConstant: 19),
            profileName.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
            profileName.topAnchor.constraint(equalTo: superView.topAnchor, constant: 195),
            
            profileDescription.widthAnchor.constraint(equalToConstant: 345),
            profileDescription.heightAnchor.constraint(equalToConstant: 19),
            profileDescription.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
            profileDescription.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 2),
            
            profileAddress.widthAnchor.constraint(equalToConstant: 200),
            profileAddress.heightAnchor.constraint(equalToConstant: 19),
            profileAddress.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 15),
            profileAddress.topAnchor.constraint(equalTo: profileDescription.bottomAnchor, constant: 2),
        ])
    }
}

extension TopView {
    private func setUI() {
        backgroundColor = .white
        
        heightAnchor.constraint(equalToConstant: 305).isActive = true
    }
}
