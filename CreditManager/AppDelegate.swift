//
//  AppDelegate.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Thread.sleep(forTimeInterval: 0.5) // adding it to see the launch screen
        let vc: UIViewController?
        //JwtService.sharedJwtServiceInstance.saveAccessToken(accessToken: "some token")
        //JwtService.sharedJwtServiceInstance.removeAccessToken()

        if JwtService.sharedJwtServiceInstance.isUserLoggedin() {
            print("Need to show th home vc")
            vc = HomeTabViewController()
        }else {
            print("Need to show th login vc")
            vc = LoginViewController()
        }
        
        let navVC = UINavigationController()
        navVC.viewControllers = [vc!]
        navVC.isNavigationBarHidden = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        window?.rootViewController = navVC
        
        return true
    }
}

