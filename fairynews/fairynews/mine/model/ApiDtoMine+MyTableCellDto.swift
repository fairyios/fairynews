//
//  MyCellModel.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation


/// “我的”模块dto
extension ApiDtoMine {
    
    public struct MyTableCellOutDto: Codable {
        public var sections: [[MyTableCellDto]]
    }
    
    public struct MyTableCellDto: Codable {
        
        var grey_text: String?
        var text: String?
        var url: String?
        var key: String?
        var tip_new: Int?
        
    }
    
}
