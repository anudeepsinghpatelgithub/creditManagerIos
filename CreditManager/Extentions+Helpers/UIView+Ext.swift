//
//  UIView+Ext.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

extension UIView {
    func pin (to superView :UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension AllAccountsViewController {
    func fetchData() ->[User] {
        let user1 = User(name: "user 1 this is long name for user so that it can come to next line", image: UIImage(named: "user1")!)
        let user2 = User(name: "user 2", image: UIImage(named: "user2")!)
        let user3 = User(name: "user 3", image: UIImage(named: "user3")!)
        let user4 = User(name: "user 4", image: UIImage(named: "user4")!)
        let user5 = User(name: "user 5", image: UIImage(named: "user5")!)
        let user6 = User(name: "user 6", image: UIImage(named: "user6")!)
        let user7 = User(name: "user 7", image: UIImage(named: "user7")!)
        let user8 = User(name: "user 8", image: UIImage(named: "user8")!)
        let user9 = User(name: "user 9", image: UIImage(named: "user9")!)
        let user10 = User(name: "user 10", image: UIImage(named: "user10")!)
        
        return [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10]
    }
}
