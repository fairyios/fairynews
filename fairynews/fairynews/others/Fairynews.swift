//
//  Fairynews.swift
//  fairynews
//
//  Created by Fairy on 2018/12/19.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation

//参考：Kingfisher.swift
//参考：http://www.cocoachina.com/ios/20171031/21000.html

//Wrappable 可包装
//Wrapper 包装纸, 包皮, 皮

/// 首先是定义了一个 FNNamespaceWrappable 协议，这个协议代表了支持 namespace 形式的扩展
public protocol FNNamespaceWrappable {
    //
    //Typealias-> 开发过程中闭包可以使用: typealias Success = (_ data: String) -> Void
    //Typealias-> 外一种使用场景是某个类型同时实现多个协议的组合是
    //associatedtype（关联类型）-> https://blog.csdn.net/github_33467146/article/details/81111060
    associatedtype WrapperType
    
    var fn: WrapperType { get }
    static var fn: WrapperType.Type { get }
}


// MARK: - 并紧接着给这个协议 extension 了默认实现。这样实现了这个协议的类型就不需要自行实现协议所约定的内容了。
extension FNNamespaceWrappable {
    
    public var fn: FNNamespaceWrapper<Self> {
        return FNNamespaceWrapper(value: self)
    }
    
    public static var fn: FNNamespaceWrapper<Self>.Type {
        return FNNamespaceWrapper.self
    }
}



/// 同时这个 Struct 实现了 TypeWrapperProtocol 协议。
/// 而 TypeWrapperProtocol 协议也带有泛型，而这两个泛型相互关联。这样就形成了最终的写法。
public struct FNNamespaceWrapper<T>: TypeWrapperProtocol {
    public typealias WrappedType = T
    public var wrappedValue: T
    
    public init(value: T) {
        self.wrappedValue = value
    }
    
    
}


/// 而 TypeWrapperProtocol 协议也带有泛型，而这两个泛型相互关联。这样就形成了最终的写法。
public protocol TypeWrapperProtocol {
    associatedtype  WrappedType
    var wrappedValue: WrappedType { get }
    
    init(value: WrappedType)
}



// MARK: - 实际使用情况的例子
//         如果想要对 String 扩展一个名为 md5 的方法，方法返回自身内容。
//         除了写成方法，为了更便于使用，定义成计算属性也是可以的，代码如下：
extension String: FNNamespaceWrappable {
    
}

//在对 TypeWrapperProtocol 这个协议做 extension 时，
//where 后面的 WrappedType 约束可以使用 == 或者 :，
//两者是有区别的。如果扩展的是值类型，比如 String，Date 等，就必须使用 ==，
//如果扩展的是类，则两者都可以使用，区别是如果使用 == 来约束，则扩展方法只对本类生效，子类无法使用。
//如果想要在子类也使用扩展方法，则使用 : 来约束。
extension TypeWrapperProtocol where WrappedType == String {
    var md5: String {
        return wrappedValue
    }
}
// 使用test
private class UseTestDemo {
    init() {
       
        let str = "fairynews".fn.md5
        debugPrint(str)
        
    }
}
