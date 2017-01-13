//
//  FBUser.swift
//  FacebookSDK
//
//  Created by Mohamed Hamed on 1/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
class FBUser {
    
    var firstName = ""
    var lastName = ""
    var name = ""
    var id = ""
    var email = ""
    var pictureUrl = ""
    var coverUrl = ""
    var gender = ""
    
    
    
    init(dictionary : Dictionary<String, Any>) {
        
        if let id = dictionary["id"] as? String{
            self.id = id
        }
        if let email = dictionary["email"] as? String{
            self.email = email
        }
        if let fName = dictionary["first_name"] as? String{
            self.firstName = fName
        }
        if let lName =  dictionary["last_name"] as? String{
            self.lastName = lName
        }
        if let name = dictionary["name"] as? String{
            self.name = name
        }
        if let pic = dictionary["picture"] as? [String : Any]
        {
            if let data = pic["data"] as? [String : Any]{
                if let url = data["url"] as? String{
                    self.pictureUrl = url
                }
            }
        }
        if let cov = dictionary["cover"] as? [String : Any]
        {
            if let url = cov["source"] as? String{
                self.coverUrl = url
            }
            
        }
        self.gender = dictionary["gender"] as! String
    }
}
