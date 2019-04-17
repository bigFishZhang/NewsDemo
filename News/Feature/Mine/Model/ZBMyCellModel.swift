//
//  ZBMyCellModel.swift
//  News
//
//  Created by bigfish on 2019/4/11.
//  Copyright © 2019 zzb. All rights reserved.
//

import Foundation
import HandyJSON

/// cell
struct ZBMyCellModel:HandyJSON {
    
    var grey_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: String = ""
    
}

/// 关注
struct ZBMyConcern:HandyJSON {
    
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
    var user_auth_info = UserAuthInfo()
    
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int = 0
    var auth_info: String = ""
}
