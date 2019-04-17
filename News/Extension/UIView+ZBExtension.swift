//
//  UIView+ZBExtension.swift
//  News
//
//  Created by bigfish on 2019/4/12.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

protocol RegisterCellFromNib {
    
}

extension RegisterCellFromNib {
    static var indentifier:String {
        return "\(self)"
    }
    static var nib:UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }

}


