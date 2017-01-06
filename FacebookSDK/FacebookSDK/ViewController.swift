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

class ViewController: UIViewController , LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let accessToken = AccessToken.current {
            print(accessToken)
        }
        let loginButton = LoginButton(readPermissions: [ ReadPermission.publicProfile, ReadPermission.email, ReadPermission.userFriends ])
        loginButton.delegate = self
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult){
        print(result)
        switch result {
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
    func loginButtonDidLogOut(_ loginButton: LoginButton){
        print("Loged out")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }


}

