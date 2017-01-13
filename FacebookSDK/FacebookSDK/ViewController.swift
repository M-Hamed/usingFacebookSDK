//
//  ViewController.swift
//  FacebookSDK
//
//  Created by Mohamed Hamed on 1/6/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FacebookShare

class ViewController: UIViewController {
    @IBOutlet weak var fbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbButton.roundedBorder()
        if let accessToken = AccessToken.current {
            print(accessToken)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton){
        print("Loged out")
    }
    
    @IBAction func fbButtonClicked(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([ ReadPermission.publicProfile, ReadPermission.email, ReadPermission.userFriends ], viewController: self) { (loginResult) in
            print(loginResult)
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print(grantedPermissions)
                print(declinedPermissions)
                print(accessToken)
                print("Logged in!")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

