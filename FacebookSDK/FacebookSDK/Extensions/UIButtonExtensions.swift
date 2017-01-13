//
//  UIButtonExtensions.swift
//  FacebookSDK
//
//  Created by Mohamed Hamed on 1/13/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import Foundation
import UIKit

//Rounded Button
extension UIButton {
    func roundedBorder() {

        self.layer.cornerRadius = layer.frame.height / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = self.backgroundColor?.cgColor
    }
}
