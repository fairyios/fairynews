//
//  MyCellModel.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation


/// “我的”模块dto: MyTableCellOut
public struct ApiDtoMineMyTableCellOut: Codable {
    public var sections: [[ApiDtoMineMyTableCell]] = [[]]
}
/// “我的”模块dto: MyTableCell
public struct ApiDtoMineMyTableCell: Codable {
    
    var grey_text: String?
    var text: String?
    var url: String?
    var key: String?
    var tip_new: Int?
        
}
