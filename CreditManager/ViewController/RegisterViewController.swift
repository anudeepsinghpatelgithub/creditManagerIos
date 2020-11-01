//
//  RegisterViewController.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import Foundation
import Foundation
import UIKit

class RegisterViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITextViewDelegate {
    
    let countryNames = ["India","United States","Australia","United Kingdom","Canada"];
    let countryCodes = ["IN","US","AU","GB","CA"];
    var selectedCountry: NSString!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countryNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = countryNames[row]
        selectedCountry = countryCodes[row] as NSString
        return data
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryCodes[row] as NSString
    }

    private let logoImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    private let registerHeadingTextView : UITextView = {
        let textView = UITextView()
        let attributeText = NSMutableAttributedString(string: "Register to manage your credits", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),NSAttributedString.Key.foregroundColor: UIColor.gray])
        textView.attributedText = attributeText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
        
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 187/255, blue: 51/255, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleRegister() {
        if emailTextField.text! == "" || passwordTextField.text! == "" {
            MyAlertView.alert(vc: self, title: "Invalid Data", message: "All the fields are required")
            return
        }
        print("email: \(emailTextField.text!)")
        print("email: \(passwordTextField.text!)")
        print("country: \(selectedCountry!)")
        print("register button pressed")
        JwtService.sharedJwtServiceInstance.removeAccessToken()
        JwtService.sharedJwtServiceInstance.saveAccessToken(accessToken: emailTextField.text!)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        self.navigationController?.pushViewController(HomeTabViewController(), animated: false)
    }
    
    private let emailLabel : UILabel = {
        let lablel = UILabel()
        lablel.text = "Email:"
        lablel.translatesAutoresizingMaskIntoConstraints = false
        return lablel
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
    
    private let passwordLabel : UILabel = {
        let lablel = UILabel()
        lablel.text = "Password:"
        lablel.translatesAutoresizingMaskIntoConstraints = false
        return lablel
    }()
    
    private let passwordTextField : UITextField = {
        let textFiled = UITextField()
        textFiled.placeholder = "Enter your password"
        textFiled.isSecureTextEntry = true
        textFiled.layer.cornerRadius = 10
        textFiled.autocorrectionType = .no
        textFiled.autocapitalizationType = .none
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        return textFiled
    }()
    
    private let countryLabel : UILabel = {
        let lablel = UILabel()
        lablel.text = "Country:"
        lablel.translatesAutoresizingMaskIntoConstraints = false
        return lablel
    }()
    
    private let countryDropDown : UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .none
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    private let loginNowBtn : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Already Have an Account? Login Now!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func goToLogin(){
        self.navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    
    let imageContainerView : UIView = {
        return UIView()
    }()
    
    let scrollView : UIScrollView = {
        let scview = UIScrollView()
        scview.isScrollEnabled = true
        scview.translatesAutoresizingMaskIntoConstraints = false
        return scview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupRegisterFormStackView()
        self.navigationController?.isNavigationBarHidden = true
       // setupRegisterForm()
    }
    // Not used just for learning
//    fileprivate func setupRegisterForm(){
//        view.addSubview(registerHeadingTextView)
//        registerHeadingTextView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor).isActive = true
//        registerHeadingTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        registerHeadingTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        registerHeadingTextView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        view.addSubview(emailLabel)
//        emailLabel.topAnchor.constraint(equalTo: registerHeadingTextView.bottomAnchor).isActive = true
//        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        view.addSubview(emailTextField)
//        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 0).isActive = true
//        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//        view.addSubview(passwordLabel)
//        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
//        passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        passwordLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        view.addSubview(passwordTextField)
//        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 0).isActive = true
//        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//        view.addSubview(countryLabel)
//        countryLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
//        countryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        countryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        countryLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        view.addSubview(countryDropDown)
//        countryDropDown.topAnchor.constraint(equalTo: countryLabel.bottomAnchor,constant: 0).isActive = true
//        countryDropDown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        countryDropDown.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        countryDropDown.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//        view.addSubview(loginNowText)
//        loginNowText.topAnchor.constraint(equalTo: countryDropDown.bottomAnchor).isActive = true
//        loginNowText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        loginNowText.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        loginNowText.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//        view.addSubview(registerButton)
//        registerButton.topAnchor.constraint(equalTo: loginNowText.bottomAnchor).isActive = true
//        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true
//        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//
//
//    }
    
    fileprivate func setupRegisterFormStackView(){
        countryDropDown.dataSource = self as UIPickerViewDataSource
        countryDropDown.delegate = self as UIPickerViewDelegate
                
        let loginFormContainerStackView = UIStackView(arrangedSubviews: [registerHeadingTextView,
                                                                         emailTextField,
                                                                         passwordTextField,
                                                                         countryDropDown,
                                                                         loginNowBtn,
                                                                         registerButton])
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
