//
//  MyCellModel.swift
//  fairynews
//
//  Created by Fairy on 2018/12/17.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation

public struct ApiDataMyCellModel: Codable {
    
    public var sections: [[MyCellModel]]
}

public struct MyCellModel: Codable {
    
    var grey_text: String?
    var text: String?
    var url: String?
    var key: String?
    var tip_new: Int?
    
}

public struct MyConcern: Codable {
    
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
