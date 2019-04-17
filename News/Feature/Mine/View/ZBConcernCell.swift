//
//  ZBConcernCell.swift
//  News
//
//  Created by bigfish on 2019/4/12.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit
import Kingfisher

class ZBConcernCell: UICollectionViewCell,RegisterCellFromNib {
    
    /// 新消息通知
    @IBOutlet weak var tipsButton: UIButton!
    
    /// 头像
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    /// vip
    @IBOutlet weak var vipImageView: UIImageView!
    
    
    /// 名字
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var myConcern:ZBMyConcern? {
        didSet{
            avatarImageView.kf.setImage(with: URL(string: (myConcern?.icon)!))
            nameLabel.text = myConcern?.name
            if let isVerify = myConcern?.is_verify {
                vipImageView.isHidden = !isVerify
            }
            if let isNewTips = myConcern?.tips {
                tipsButton.isHidden = !isNewTips
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tipsButton.layer.borderWidth = 1
        tipsButton.layer.theme_borderColor = "colors.cellBackgroundColor"
        theme_backgroundColor = "colors.cellBackgroundColor"
        tipsButton.theme_backgroundColor = "colors.globalRedColor"
        nameLabel.theme_textColor = "colors.black"
    }

}
