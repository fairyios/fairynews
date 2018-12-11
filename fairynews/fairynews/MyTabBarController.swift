//
//  MyTabBarViewController.swift
//  fairynews
//
//  Created by Fairy on 2018/12/6.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class MyTabBarController: UITabBarController {
    
    
    
    /// Called after the controller's view is loaded into memory.
    ///
    /// - Parameters:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let homeController = HomeViewController()
        let videoController = VideoViewController()
        let mineController = MineViewController()
        let huoshanController = HuoshanViewController()
        
        setOneChildController(homeController, title: "首页", imageName: "home_tabbar_32x32_", selectedImageName: "home_tabbar_press_32x32_")
        setOneChildController(videoController, title: "视频", imageName: "video_tabbar_32x32_", selectedImageName: "video_tabbar_press_32x32_")
        setOneChildController(huoshanController, title: "火山", imageName: "huoshan_tabbar_32x32_", selectedImageName: "huoshan_tabbar_press_32x32_")
        setOneChildController(mineController, title: "我的", imageName: "mine_tabbar_32x32_", selectedImageName: "mine_tabbar_press_32x32_")
        
        //tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性 改过来
        //self.setValue(MyTabBar.self, forKey: "tabBar")// MyTabBar.self 会报错
        self.setValue(MyTabBar(), forKey: "tabBar")
    }
    
    
    /// Notifies the view controller that its view was added to a view hierarchy.
    ///
    /// - Parameter animated: If true, the view was added to the window using an animation.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        debugPrint("[MyTabBarController]self.tabBar.subviews = \(self.tabBar.subviews)")
    }
    
    /// 初始化一个tab bar 的子控制器
    ///
    /// - Parameters:
    ///   - childController: 根目录控制器
    ///   - title: tab bar 里的标题
    ///   - imageName: 图标
    ///   - selectedImageName: 选中的图标
    private func setOneChildController(_ childController: UIViewController,
        title: String, imageName: String, selectedImageName: String?) {
        
        childController.title = title
        childController.navigationItem.title = title
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        if selectedImageName != nil {
            childController.tabBarItem.selectedImage = UIImage(named: selectedImageName!)?.withRenderingMode(.alwaysOriginal)
        }
        
        let myNavigation = MyNavigationController(rootViewController: childController)
        self.addChild(myNavigation)
        
    }
}
