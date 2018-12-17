//
//  MineGuanzhuRowView.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

extension MineView {
    
    /// 我的关注Table Cell
    final class GuanzhuTableCell: UITableViewCell {
        
        
        
        /// 第一行
        public lazy var firstLine: MineView.MineDefaultTableCellRowView = {
            let view = MineView.MineDefaultTableCellRowView()
            return view
        }()
        
        /// 第2行
        public lazy var secondLine: SecondLineView = {
            let view = SecondLineView()
            view.backgroundColor = UIColor.red
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
            
            //第2行
            self.addSubview(self.secondLine)
            self.secondLine.snp.makeConstraints { (make) in
                make.top.equalTo(self.firstLine.snp.bottom)
                make.left.equalTo(self)
                make.right.equalTo(self)
                make.bottom.equalTo(self)
            }
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        //MARK: -  第2行
        public final class SecondLineView: UIView {
            
        }
    }



}
