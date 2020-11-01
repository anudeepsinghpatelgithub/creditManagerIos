//
//  UserTableViewCell.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    var userImageView = UIImageView()
    var userName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userImageView)
        addSubview(userName)
        configureImage()
        configureName()
        setImageConstraints()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(){
        userImageView.layer.cornerRadius = 40
        userImageView.layer.masksToBounds = false
        userImageView.clipsToBounds = true
    }
    
    func configureName(){
        userName.numberOfLines = 0
        userName.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints(){
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor).isActive = true
    }
    
    func setTitleConstraints(){
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userName.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor,constant: 20).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 80).isActive = true
        userName.trailingAnchor.constraint(equalTo: trailingAnchor , constant: -12).isActive = true
    }
    
    func set(user: User){
        userImageView.image = user.image
        userName.text = user.name
    }
}
