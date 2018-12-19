//
//  MineDefaultTableCellRowView.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import SnapKit

final class MineDefaultTableCellRowView: UIView {
    
    /// 是否显示右边的文本
    private var isShowRightText = false
    /// 是否显示中间的图标
    private var isShowCenterLogo = false
    
    /// 左边的label
    public lazy var leftLabel: UILabel = {
        var label = UILabel()
        //label.backgroundColor = UIColor.red
        
        return label
    }()
    
    
    /// 右边的label
    public lazy var rightLabel: UILabel = {
        var label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15) //设置字体大小
        return label
    }()
    
    // 右边的图标
    public lazy var rightImage: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "setting_rightarrow_8x14_"))
        imgView.frame.size.width = 8
        imgView.frame.size.height = 14
        return imgView
    }()
    
    // 中间的图标
    public lazy var centerLogo: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "setting_rightarrow_8x14_"))
        imgView.frame.size.width = 30
        imgView.frame.size.height = 30
        return imgView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - isShowRightText: 是否显示右边的文本
    ///   - isShowCenterLogo: 是否显示中间的图标
    convenience init(_ isShowRightText: Bool, _ isShowCenterLogo: Bool) {
        self.init(frame: CGRect.zero)
        
        self.isShowRightText = isShowRightText
        self.isShowCenterLogo = isShowCenterLogo
        
        //左边的label
        self.addSubview(self.leftLabel)
        self.leftLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        //右边的图标
        self.addSubview(self.rightImage)
        self.rightImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        
        //右边的label
        self.addSubview(self.rightLabel)
        self.rightLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self.rightImage.snp.left).offset(-10)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
} 
