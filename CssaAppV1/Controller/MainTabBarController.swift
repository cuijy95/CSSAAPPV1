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
        
        let handBookController = HandBookViewController()
        let handBookNavController = UINavigationController(rootViewController: handBookController)
        handBookNavController.tabBarItem.title = "新生手册"
        //handBookNavController.tabBarItem.image = UIImage(named: <#T##String#>)
        
        let cssaPageController = CssaPageController()
        let cssaPageNavController = UINavigationController(rootViewController: cssaPageController)
        cssaPageNavController.tabBarItem.title = "学生会"
        
        let activityController = ActivityViewController()
        let activityNavController = UINavigationController(rootViewController: activityController)
        activityNavController.tabBarItem.title = "活动资讯"
        
        let toolController = ToolsViewController()
        let toolNavController = UINavigationController(rootViewController: toolController)
        toolNavController.tabBarItem.title = "工具"
        
        viewControllers = [firstPageNavController, handBookNavController, cssaPageNavController,activityNavController,toolNavController]
    }
}
