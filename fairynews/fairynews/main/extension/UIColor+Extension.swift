//
//  UIColor+Extension.swift
//  fairynews
//
//  Created by Fairy on 2018/12/12.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - r: red：内部处理 / 255
    ///   - g: green：内部处理 / 255
    ///   - b: blue：内部处理 / 255
    ///   - alpha: alpha
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
    }
    
    
    /// 返回全局的背景颜色
    ///   [在方法的func关键字之前加上关键字static或者class都可以用于指定类方法.]
    ///   [不同的是用class关键字指定的类方法可以被子类重写, 如下: override class func work() { ... }]
    /// - Returns: f8f9f7
    class func globalBackgroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247, alpha: 1.0)
    }
}
