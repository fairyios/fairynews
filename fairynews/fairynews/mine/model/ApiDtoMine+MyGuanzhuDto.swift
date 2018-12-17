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
     
    
    public struct MyGuanzhuDto: Codable {
        
        var name: String = ""
        var url: String = ""
        var total_count: Int = 0
        var description: String = ""
        var time: String = ""
        var type: String = ""
        var icon: String = ""
        var userid: Int = 0
        var is_verify: Bool = false
        var media_id: Int = 0
        var tips: Bool = false
        var id: Int = 0
        var user_auth_info: UserAuthInfo
    }
    
    public struct UserAuthInfo: Codable {
        var auth_type: Int = 0
        var auth_info: String = ""
    }
}
