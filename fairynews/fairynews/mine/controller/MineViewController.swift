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
    
    
    
    /// Called after the controller's view is loaded into memory.
    /// 在控制器'聙聂视图加载到内存后调用。
    override func viewDidLoad() {
        super.viewDidLoad()

        debugPrint("[MineViewController][func viewDidLoad()]reuseIdentifier = \(self.reuseIdentifier)")
        debugPrint("[MineViewController][func viewDidLoad()]self.tableView.headerView(forSection: 0) = \(String(describing: self.tableView.headerView(forSection: 0)))")
        
        self.tableView.tableFooterView = UIView()
    }
    
    
    /// Notifies the view controller that its view was added to a view hierarchy.
    /// 通知视图控制器其视图已添加到视图层次结构中。
    /// - Parameter animated: animated description
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        debugPrint("[MineViewController][func viewDidAppear()]self.tableView.headerView(forSection: 0) = \(String(describing: self.tableView.headerView(forSection: 0)))")
        
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
        debugPrint("[MineViewController][节点的header的view视图重构]ConstDefine.screenWidth = \(ConstDefine.screenWidth)")
        debugPrint("[MineViewController][节点的header的view视图重构]tableView.frame.width = \(tableView.frame.width)")
        debugPrint("[MineViewController][节点的header的view视图重构]tableView.headerView(forSection: section) = \(String(describing: tableView.headerView(forSection: section)))")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: self.heightForHeaderInSection))
        view.backgroundColor = UIColor.gray
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
