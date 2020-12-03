//
//  CustomTabBarController.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/02.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
    }
    
    func setUpStyle() {
        UITabBar.clearShadow()
    }
    
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
