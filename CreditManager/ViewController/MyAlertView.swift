//
//  MyAlertView.swift
//  CreditManager
//
//  Created by Patel, Anudeep on 31/10/20.
//

import UIKit

class MyAlertView {
   
     static func alert(vc: UIViewController, title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
             let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
             })
             alert.addAction(ok)
//             let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
//             })
//             alert.addAction(cancel)
             DispatchQueue.main.async(execute: {
                vc.present(alert, animated: true)
        })
    }
}
