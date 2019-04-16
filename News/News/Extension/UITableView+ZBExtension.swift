//
//  UITableView+ZBExtension.swift
//  News
//
//  Created by bigfish on 2019/4/12.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    /// 注册cll
    ///
    /// - Parameter cell: <#cell description#>
    func zb_registerCell<T:UITableViewCell>(cell:T.Type) where T:RegisterCellFromNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.indentifier)
        }else {
            register(cell,forCellReuseIdentifier: T.indentifier)
        }
    }
    
    /// 从缓存池出列已经存在的cell
    ///
    /// - Parameter indexPath: <#indexPath description#>
    /// - Returns: <#return value description#>
    func zb_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T:RegisterCellFromNib {
        
        return dequeueReusableCell(withIdentifier:T.indentifier, for: indexPath) as! T
        
    }
    
    
}
