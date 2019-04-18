//
//  ZBNoLoginHeaderView.swift
//  News
//
//  Created by bigfish on 2019/4/13.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme

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
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var bottomView: UIView!
    
    class func headerView() -> ZBNoLoginHeaderView {
            return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! ZBNoLoginHeaderView
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        nightButton.isSelected = UserDefaults.standard.bool(forKey: IS_NIGHT)
        
        let effectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectX.maximumRelativeValue = 20
        effectX.minimumRelativeValue = -20
        stackView.addMotionEffect(effectX)
        
        /// 设置主题
        mobileButton.theme_setImage("images.loginMobileButton", forState: .normal)
        wechatButton.theme_setImage("images.loginWechatButton", forState: .normal)
        qqButton.theme_setImage("images.loginQQButton", forState: .normal)
        sinaButton.theme_setImage("images.loginSinaButton", forState: .normal)
        favoriteButton.theme_setImage("images.mineFavoriteButton", forState: .normal)
        historyButton.theme_setImage("images.mineHistoryButton", forState: .normal)
        nightButton.theme_setImage("images.dayOrNightButton", forState: .normal)
        nightButton.setTitle("夜间", for: .normal)
        nightButton.setTitle("日间", for: .selected)
        moreLoginButton.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreLoginButton.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        favoriteButton.theme_setTitleColor("colors.black", forState: .normal)
        historyButton.theme_setTitleColor("colors.black", forState: .normal)
        nightButton.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
    }
    
    /// 点击了日间夜间切换按钮
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func nightButtonClicked(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        UserDefaults.standard.set(sender.isSelected, forKey: IS_NIGHT)
        ZBTheme.switchNight(sender.isSelected)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: DayOrNightButtonDidClickedNotification), object: sender.isSelected)
    }
    

}
