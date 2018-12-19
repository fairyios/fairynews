//
//  MineViewController.swift
//  fairynews
//
//  Created by Fairy on 2018/12/7.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import Kingfisher

final class MineViewController: UITableViewController {
    
    private let _apiService: IMineApiService = MineApiService() as IMineApiService

    //"Attribute.DefineTableViewCell" 获取类名
    //private let reuseIdentifier2: String = NSStringFromClass(UITableViewCell.self)
    //"DefineTableViewCell" 获取类名
    private let reuseIdentifier: String = String(describing: UITableViewCell.self)
    
    private let heightForHeaderInSection: CGFloat = 15
    
    
    private var sections: [[ApiDtoMine.MyTableCellDto]] = []
    
    
    
    /// Called after the controller's view is loaded into memory.
    /// 在控制器'聙聂视图加载到内存后调用。
    override func viewDidLoad() {
        super.viewDidLoad()

        debugPrint("[MineViewController][func viewDidLoad()]reuseIdentifier = \(self.reuseIdentifier)")
        debugPrint("[MineViewController][func viewDidLoad()]self.tableView.headerView(forSection: 0) = \(String(describing: self.tableView.headerView(forSection: 0)))")
        
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor.globalBackgroundColor()
        self.tableView.register(MineView.DefaultTableCell.self, forCellReuseIdentifier: String(describing: MineView.DefaultTableCell.self))
        self.tableView.register(MineView.GuanzhuTableCell.self, forCellReuseIdentifier: String(describing: MineView.GuanzhuTableCell.self))
        
        _apiService.loadMyCellData{(apiData: ApiDtoMine.MyTableCellOutDto?) in
            debugPrint("[MineViewController][func viewDidAppear()] 网络请求完成")
            
            var guanzhu = ApiDtoMine.MyTableCellDto()
            guanzhu.grey_text = ""
            guanzhu.text = "我的关注"
            guanzhu.tip_new = 0
            guanzhu.url = ""
            
            var firstSection = apiData?.sections.first!
            firstSection?.insert(guanzhu, at: 0)
            
            self.sections = (apiData?.sections)!
            self.sections[0] = firstSection!
            self.tableView.reloadData()
        }
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
        return self.sections.count
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
        view.backgroundColor = UIColor.globalBackgroundColor() //UIColor.gray
        return view
    }
    
    /// 每个节点的行数
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].count
    }
    
    
    /// 单元格的行高
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0 && indexPath.row == 0) {
            return 100
        }
        
        
        let superHeight = super.tableView(tableView, heightForRowAt: indexPath)
        debugPrint("[MineViewController][单元格的行高]superHeight = \(superHeight)")
        
        return superHeight
    }
    
    
    /// 单元格选中了第几行
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //取消选择行
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /// 单元格的显示内容
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionModel = self.sections[indexPath.section]
        let sectionRow = sectionModel[indexPath.row]
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let guanzhu = MineView.GuanzhuTableCell(style: .default, reuseIdentifier: String(describing: MineView.GuanzhuTableCell.self))
            guanzhu.firstLine.leftLabel.text = sectionRow.text
            guanzhu.firstLine.rightLabel.text = sectionRow.grey_text
            
            return guanzhu
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MineView.DefaultTableCell.self), for: indexPath) as! MineView.DefaultTableCell
        cell.firstLine.leftLabel.text = sectionRow.text
        cell.firstLine.rightLabel.text = sectionRow.grey_text
        return cell
    }
}
