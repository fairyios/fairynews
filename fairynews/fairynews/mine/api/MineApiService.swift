//
//  Networks.swift
//  fairynews
//
//  Created by Fairy on 2018/12/14.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Alamofire

// MARK: - 我的 mine
public protocol IMineApiService: IApiService {
    
    // MARK: 我的界面 cell 的数据
    func loadMyCellData(_ completionHandler: @escaping (_ apiData: ApiDtoMineMyTableCellOut?) -> ())
    // MARK: 我的关注数据
    func loadMyGuanzhu(_ completionHandler: @escaping (_ concerns: ApiDtoMineMyGuanzhuOut?) -> ())
}

// MARK: - 我的 mine
public class MineApiService: IMineApiService {
    
    
    
    // MARK: 我的界面 cell 的数据
    public func loadMyCellData(_ completionHandler: @escaping (_ result: ApiDtoMineMyTableCellOut?) -> ()) {
        let url = ApiConst.baseUrl + "/user/tab/tabs/?"
        let params = ["device_id": ApiConst.deviceId]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                //提示网络异常
                return
            }
            
            //debugPrint("[MineApiService][loadMyCellData()]responseValue = \(String(describing: response.result.value))")
            
            let responseValue = response.result.value
            if (responseValue == nil) {
                //提示
                return
            }
            
            do {
                //JSONSerialization.WritingOptions.prettyPrinted
                let jsonData = try JSONSerialization.data(withJSONObject: responseValue!, options: .prettyPrinted)
                let apiResult = try JSONDecoder().decode(ApiResult<ApiDtoMineMyTableCellOut>.self, from: jsonData)
                
                //debugPrint(apiResult.data as Any)
                
                completionHandler(apiResult.data)
                
            } catch {
                debugPrint(error)
            }
            
           
        }
        
        
    }
    // MARK: 我的关注数据
    public func loadMyGuanzhu(_ completionHandler: @escaping (_ concerns: ApiDtoMineMyGuanzhuOut?) -> ()) {
        let url = ApiConst.baseUrl + "/concern/v2/follow/my_follow/?"
        let params = ["device_id": ApiConst.deviceId]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                //提示网络异常
                return
            }
            
            //debugPrint("[MineApiService][loadMyCellData()]responseValue = \(String(describing: response.result.value))")
            
            let responseValue = response.result.value
            if (responseValue == nil) {
                //提示
                return
            }
            
            do {
                //JSONSerialization.WritingOptions.prettyPrinted
                let jsonData = try JSONSerialization.data(withJSONObject: responseValue!, options: .prettyPrinted)
                let apiResult = try JSONDecoder().decode(ApiDtoMineMyGuanzhuOut.self, from: jsonData)
                
                //debugPrint(apiResult.data as Any)
                
                completionHandler(apiResult)
                
            } catch {
                debugPrint(error)
            }
        }
    }
}
