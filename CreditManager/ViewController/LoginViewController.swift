//
//  LoginViewController.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import Foundation
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private let logoImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let loginHeadingTextView : UITextView = {
        let textView = UITextView()
        let attributeText = NSMutableAttributedString(string: "Login to manage your credits", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.gray])
        textView.attributedText = attributeText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 187/255, blue: 51/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField : UITextField = {
        let textFiled = UITextField()
        textFiled.placeholder = "Enter your Email"
        textFiled.keyboardType = .emailAddress
        textFiled.layer.cornerRadius = 10
        textFiled.autocorrectionType = .no
        textFiled.autocapitalizationType = .none
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        return textFiled
    }()
    
    private let passwordTextField : UITextField = {
        let textFiled = UITextField()
        textFiled.placeholder = "Enter your password"
        textFiled.isSecureTextEntry = true
        textFiled.autocorrectionType = .no
        textFiled.autocapitalizationType = .none
        textFiled.layer.cornerRadius = 10
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 12, *) {
            // iOS 12 & 13: Not the best solution, but it works.
            textFiled.textContentType = .oneTimeCode
        } else {
            // iOS 11: Disables the autofill accessory view.
            // For more information see the explanation below.
            textFiled.textContentType = .init(rawValue: "")
        }
        return textFiled
    }()
    
    
    private let registerNowBttn : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Don't Have Account? Register Now", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func goToRegister(){
        self.navigationController?.pushViewController(RegisterViewController(), animated: false)
    }
    
    @objc private func handleLogin() {
        if emailTextField.text! == "" || passwordTextField.text! == "" {
            MyAlertView.alert(vc: self, title: "Invalid Data", message: "All the fields are required")
            return
        }
        print("email: \(emailTextField.text!)")
        print("email: \(passwordTextField.text!)")
        print("register button pressed")
        JwtService.sharedJwtServiceInstance.removeAccessToken()
        JwtService.sharedJwtServiceInstance.saveAccessToken(accessToken: emailTextField.text!)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        self.navigationController?.pushViewController(HomeTabViewController(), animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupLoginFormStackView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    fileprivate func setupLoginFormStackView(){
        
        let loginFormContainerStackView = UIStackView(arrangedSubviews: [loginHeadingTextView,
                                                                         emailTextField,
                                                                         passwordTextField,
                                                                         registerNowBttn,
                                                                         loginButton])
        loginFormContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        loginFormContainerStackView.distribution = .fillEqually
        loginFormContainerStackView.axis = .vertical
        loginFormContainerStackView.spacing = UIStackView.spacingUseSystem

        view.addSubview(loginFormContainerStackView)
        
        NSLayoutConstraint.activate([
            loginFormContainerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            loginFormContainerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginFormContainerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            loginFormContainerStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
        ])
    }
    
    fileprivate func setupLayout(){
        
        let imageContainerView = UIView()
        view.addSubview(imageContainerView)
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        imageContainerView.addSubview(logoImageView)
        
        // logo image view constraints
        logoImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        logoImageView.heightAnchor.constraint(equalTo: imageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
