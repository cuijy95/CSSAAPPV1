//
//  File.swift
//  CssaAppV1
//
//  Created by Qin Yang on 2020-03-04.
//  Copyright © 2020 CSSA. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstPageController = FirstPageViewController()
        let firstPageNavController = UINavigationController(rootViewController: firstPageController)
        firstPageNavController.tabBarItem.title = "首页"
        //firstNavController.tabBarItem.image = UIIamge(named: imageName)
        
        viewControllers = [firstPageNavController]
    }
}
