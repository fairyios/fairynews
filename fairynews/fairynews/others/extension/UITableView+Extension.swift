//
//  UITableView+Extension.swift
//  fairynews
//
//  Created by Fairy on 2018/12/19.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit



extension TypeWrapperProtocol where WrappedType : UITableView {
    
    //self.tableView.register(MineDefaultTableCell.self, forCellReuseIdentifier: String(describing: MineDefaultTableCell.self))
    //self.tableView.register(MineGuanzhuTableCell.self, forCellReuseIdentifier: String(describing: MineView.GuanzhuTableCell.self))
    
    //self.tableView.dequeueReusableCell(withIdentifier: String(describing: MineView.DefaultTableCell.self), for: indexPath) as! MineView.DefaultTableCell

    
    /// 注册 cell 方法
    ///
    /// - Parameter type: type description
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        let tableView = wrappedValue
        let indentifier = String(describing: T.self)
        tableView.register(T.self, forCellReuseIdentifier: indentifier)
    }
    
    
    /// 从缓存池出队已经存在的 Cell
    ///
    /// - Parameter indexPath: indexPath description
    /// - Returns: UITableViewCell
    func dequeueReusableCell<T>(_ type: T.Type, _ indexPath: IndexPath) -> T where T: UITableViewCell {
        let tableView = wrappedValue
        let identifier = String(describing: T.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! T
        return cell
    }
}
