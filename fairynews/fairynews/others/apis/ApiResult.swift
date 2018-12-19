//
//  ApiResult.swift
//  fairynews
//
//  Created by Fairy on 2018/12/14.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation
 

/// T 遵从 Codable；ApiResult<T: Codable> 也要遵从 Codable
public struct ApiResult<T: Codable>: Codable {
    
    public let message: String // = ""
    
    public let data: T?
}


public struct ApiData: Codable {
    
}
