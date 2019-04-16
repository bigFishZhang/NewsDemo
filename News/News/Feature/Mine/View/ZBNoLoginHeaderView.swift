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
    
    /// 背景图
    @IBOutlet weak var bgImageView: UIImageView!
    /// sina
    @IBOutlet weak var sinaButton: UIButton!
    /// qq
    @IBOutlet weak var qqButton: UIButton!
    /// wechat
    @IBOutlet weak var wechatButton: UIButton!
    /// mobile
    @IBOutlet weak var mobileButton: UIButton!
    /// 更多按钮
    @IBOutlet weak var moreLoginButton: AnimatableButton!
    /// as
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBOutlet weak var historyButton: UIButton!
    
    @IBOutlet weak var nightButton: UIButton!
    
    class func headerView() -> ZBNoLoginHeaderView {
            return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! ZBNoLoginHeaderView
    }


}
