//
//  JwtService.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

final class JwtService {
    static let sharedJwtServiceInstance = JwtService()
    private init() {
        
    }
    let userDefaults = UserDefaults.standard
    
    func saveAccessToken(accessToken: String) {
        userDefaults.set(accessToken, forKey: accessTokenKey)
    }
    
    func getAccessToken() -> String {
        if let token  = userDefaults.object(forKey: accessTokenKey) as? String{
            return token
        }else {
            return ""
        }
    }
    
    func isUserLoggedin() -> Bool {
        if getAccessToken() == "" {
            return false;
        }
        return true
    }
    
    func removeAccessToken(){
        userDefaults.removeObject(forKey: accessTokenKey)
    }
    
}
