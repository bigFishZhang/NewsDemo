//
//  ZBNetworkTool.swift
//  News
//
//  Created by bigfish on 2019/4/11.
//  Copyright © 2019 zzb. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol ZBNetworkToolProtocol {
    // --------------------- mine ---------------------
    // 我的cell数据
    static func loadMyCellData(completionHandler:@escaping (_ section:[[ZBMyCellModel]])->())
    // 我的关注数据
    static func loadMyConcern()
    
}

extension ZBNetworkToolProtocol {
    // --------------------- mine ---------------------
    // 我的cell数据
    static func loadMyCellData(completionHandler:@escaping (_ section:[[ZBMyCellModel]])->()) {
        let url    = SERVER + "/user/tab/tabs/?"
        let params = ["device_id":DEVICE_ID]
        
        Alamofire.request(url,parameters:params).responseJSON { (response) in
            guard response.result.isSuccess else {
                print("loadMyCellData failed")
                return
            }
            if let value = response.result.value {
                let jsonData = JSON(value)
                guard jsonData["message"] == "success" else {
                    print("loadMyCellData is not success")
                    return
                }
                if let cellData = jsonData["data"].dictionary {
                    if let sections = cellData["sections"]?.array{
                        var sectionArray = [[ZBMyCellModel]]()
                        for item in sections {
                            var rows  = [ZBMyCellModel]()
                            for row in item.arrayObject! {
                                let myCellModel = ZBMyCellModel.deserialize(from: row as? Dictionary)
                                rows.append(myCellModel!)
                            }
                            sectionArray.append(rows)
                        }
                        completionHandler(sectionArray)
                    }
                }
            }
        }
    }
    // 我的关注数据
    static func loadMyConcern() {
        
    }
    
}



struct ZBNetworkTool:ZBNetworkToolProtocol {
    
}



