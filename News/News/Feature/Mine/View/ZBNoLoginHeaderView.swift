//
//  ZBNoLoginHeaderView.swift
//  News
//
//  Created by bigfish on 2019/4/13.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit
import IBAnimatable

class ZBNoLoginHeaderView: UIView {
    
    class func headerView() -> ZBNoLoginHeaderView {
            return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! ZBNoLoginHeaderView
    }


}
