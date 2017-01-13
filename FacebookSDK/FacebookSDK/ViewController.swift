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
                
                let params = ["fields":"id,email,name,first_name,last_name,picture.width(1000).height(1000),gender,cover"]
                let graphRequest = GraphRequest(graphPath: "me", parameters: params)
                graphRequest.start {
                    (urlResponse, requestResult) in
                    
                    switch requestResult {
                    case .success(let graphResponse):
                        if let responseDictionary = graphResponse.dictionaryValue {
                            
                            let user = FBUser(dictionary: responseDictionary)
                            self.showAlert(title: user.name, message: user.email)
                            
                            
                        }
                    case .failed(let error):
                        print("error in graph request:", error)
                        break
                        
                    }
                }
                
            }
        }
    }
    func showAlert(title : String , message : String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            (result : UIAlertAction) -> Void in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

