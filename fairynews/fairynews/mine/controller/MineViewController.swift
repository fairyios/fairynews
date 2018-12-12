//
//  MineViewController.swift
//  fairynews
//
//  Created by Fairy on 2018/12/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class MineViewController: UITableViewController {

    //"Attribute.DefineTableViewCell" 获取类名
    //private let reuseIdentifier2: String = NSStringFromClass(UITableViewCell.self)
    //"DefineTableViewCell" 获取类名
    private let reuseIdentifier: String = String(describing: UITableViewCell.self)
    
    private let heightForHeaderInSection: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()

        debugPrint("[MineViewController][func viewDidLoad()]reuseIdentifier = \(self.reuseIdentifier)")
        
        self.tableView.tableFooterView = UIView()
    }
}


extension MineViewController {
    
    
    /// 节点数
    ///
    /// - Parameter tableView: tableView description
    /// - Returns: return value description
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    /// 节点标题
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "header title at " + String(section)
    }
    
    
    /// 节点的header的高度
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.heightForHeaderInSection
    }
    
    
    /// 节点的header的view视图重构
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: ConstDefine.screenWidth, height: self.heightForHeaderInSection))
        return view
    }
    
    /// 每个节点的行数
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    /// 单元格的显示内容
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: self.reuseIdentifier)
        cell.textLabel?.text = "测试"
        return cell
    }
}
