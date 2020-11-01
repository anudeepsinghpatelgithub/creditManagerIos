//
//  HomeViewController.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import Foundation
import UIKit

class HomeTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 255/255, green: 187/255, blue: 51/255, alpha: 1)
        setupTabs3()
    }
    
    func  setupTabs3() {
        let allAccountsVC = UINavigationController(rootViewController: AllAccountsViewController())
        allAccountsVC.title = "All"
        let creidtsVC = UINavigationController(rootViewController: CreditAcccountsViewController())
        creidtsVC.title = "Credits"
        let debitsVC = UINavigationController(rootViewController: DebitAccountsViewController())
        debitsVC.title = "Debits"
        let settingVC = UINavigationController(rootViewController: SettingsViewController())
        settingVC.title = "Settings"
        
        viewControllers = [allAccountsVC, creidtsVC, debitsVC,settingVC]
        guard let items = tabBar.items else {
             return
        }
            
        let images = ["house","creditcard","megaphone","gear"]
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
//        tabBarController.modalPresentationStyle = .fullScreen
//        present(tabBarController, animated: true)
        
    }

}
