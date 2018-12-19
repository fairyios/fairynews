//
//  MyCellModel.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation

/// “我的”模块dto: 我的关注
public struct ApiDtoMineMyGuanzhuOut: Codable {
    var guide_text: String = ""
    var max_cursor: Int = 0
    var guide_url: String = ""
    var offset: Int = 0
    var has_more: Bool = false
    var message: String = ""
    var blank_text: String = ""
    var data: [ApiDtoMineMyGuanzhu] = []
}
/// “我的”模块dto: 我的关注
public struct ApiDtoMineMyGuanzhu: Codable {
    
    var name: String = ""
    var url: String = ""
    var total_count: Int? = 0
    var description: String? = ""
    var time: String? = ""
    var type: String = ""
    var icon: String = ""
    var userid: Int? = 0
    var is_verify: Int? = 0
    var media_id: Int? = 0
    var tips: Bool = false
    var id: Int? = 0
    var user_auth_info: String?
    
    public func get_user_auth_info() -> ApiDtoMineUserAuthInfo?  {
        if self.user_auth_info == nil { return nil }
        if self.user_auth_info == "" { return nil }
        
        do {
            //JSONSerialization.WritingOptions.prettyPrinted
            let jsonData = try JSONSerialization.data(withJSONObject: self.user_auth_info!, options: .prettyPrinted)
            let apiResult = try JSONDecoder().decode(ApiDtoMineUserAuthInfo.self, from: jsonData)
            debugPrint(apiResult)
            return apiResult
        } catch {
            debugPrint(error)
            return nil
        }
    }
}

public struct ApiDtoMineUserAuthInfo: Codable {
    var auth_type: Int? = 0
    var auth_info: String? = ""
}
