//
//  MineCellView.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

//我的：默认的Table Cell
final class MineDefaultTableCell : UITableViewCell {
    
    
    /// 第一行
    public lazy var firstLine: MineDefaultTableCellRowView = {
        let view = MineDefaultTableCellRowView(true, false)
        return view
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //第一行
        self.addSubview(self.firstLine)
        self.firstLine.snp.makeConstraints { (make) in
            make.top.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

