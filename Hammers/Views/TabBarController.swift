//
//  TabBarController.swift
//  Hammers
//
//  Created by sergey on 14.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = .init(gray: 0.5, alpha: 0.5)
    }
    
}
