//
//  UICollectionView+ZBExtension.swift
//  News
//
//  Created by bigfish on 2019/4/12.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

extension UICollectionView {
    /// 注册cll
    ///
    /// - Parameter cell: <#cell description#>
    func zb_registerCell<T:UICollectionViewCell>(cell:T.Type) where T:RegisterCellFromNib {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.indentifier)

        }else {
            register(cell, forCellWithReuseIdentifier: T.indentifier)
        }
    }
    
    /// 从缓存池出列已经存在的cell
    ///
    /// - Parameter indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func zb_dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T:RegisterCellFromNib {
        return dequeueReusableCell(withReuseIdentifier: T.indentifier, for: indexPath) as! T
    }
    
    
}
