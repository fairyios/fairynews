//
//  MyTabBar.swift
//  fairynews
//
//  Created by Fairy on 2018/12/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {

    /// 发布按钮
    /// private 绝对私用，只有当前类可以访问，当前类的扩张也不能访问
    /// fileprivate 文件私用，只有当前文件可以访问，其它文件都不能访问
    /// open 全部能访问
    /// internal 默认，可以不写。
    private lazy var btnPublish: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "feed_publish_44x44_"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "feed_publish_press_44x44_"), for: UIControl.State.selected)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.btnPublish)
        
        //let tabbar = UITabBar.appearance()// 获取tabbar
        //
        //设置当前Tab的字体颜色
        self.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0) //UIColor.magenta//图片文字一起变色
        self.barStyle = UIBarStyle.black
        self.isTranslucent = true //毛玻璃特效
        //设置backgroundColor需要isTranslucent=true
        self.backgroundColor = UIColor.white
        //self.backgroundImage = nil
        //self.shadowImage = nil
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        debugPrint("[MyTabBar][layoutSubviews]self.frame.height = \(self.frame.height)")
        debugPrint("[MyTabBar][layoutSubviews]self.frame.midY = \(self.frame.midY)")
        
        //let yuanXing = CGFloat(self.frame.width / CGFloat(self.subviews.count))
        let width = CGFloat(90.0)//self.frame.height
        let height = CGFloat(90.0)//self.frame.height
        let x = CGFloat(self.frame.width * 0.5) - CGFloat((width / 2))
        let y = CGFloat(0.0) - CGFloat(25.0) //CGFloat(self.frame.height * 0.5) - CGFloat(10.0)
        self.btnPublish.frame = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: width, height: height))
        
        debugPrint("[MyTabBar][layoutSubviews]self.subviews.count = \(self.subviews.count)")
        debugPrint("[MyTabBar][layoutSubviews]self.btnPublish.frame.width = \(self.btnPublish.frame.width)")
        
        let tabBarItem = self.subviews.filter { return $0.isKind(of: NSClassFromString("UITabBarButton")!) }
        debugPrint("[MyTabBar][layoutSubviews] tabBarItem.count = \( tabBarItem.count)")
        
        //中间发布按钮的索引
        let publishIndex = (tabBarItem.count / 2)
        
        //每一个item平分宽度
        let itemWidth = CGFloat((self.frame.width - self.btnPublish.frame.width) / CGFloat(tabBarItem.count))
        
        for (index, item) in tabBarItem.enumerated() {
            var x: CGFloat = 0.0
            if(index >= publishIndex) {
                x = itemWidth * CGFloat(index) + self.btnPublish.frame.width
            } else {
                x = itemWidth * CGFloat(index)
            }
            item.frame = CGRect(x: x, y: 0, width: itemWidth, height: self.frame.height)
        }
    }
    
    

}
