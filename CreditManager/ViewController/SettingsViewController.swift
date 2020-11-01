//
//  SettingsViewController.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        print("Test 12dsdsd3")
        
        setUpLayout()
    }
    
    
    let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 187/255, blue: 51/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleLogout(){
        JwtService.sharedJwtServiceInstance.removeAccessToken()
        self.navigationController?.tabBarController?.tabBar.removeFromSuperview()
        self.navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    
    
    func setUpLayout(){
        view.addSubview(logoutButton)
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
