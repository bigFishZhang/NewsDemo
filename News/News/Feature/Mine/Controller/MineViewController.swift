//
//  MineViewController.swift
//  News
//
//  Created by bigfish on 2019/4/10.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class MineViewController: UITableViewController {
    var sections = [[ZBMyCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏多余的cell
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.gloablBackgroundColor()
        tableView.register( UINib(nibName: String(describing: ZBMyOtherCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ZBMyOtherCell.self))
        tableView.separatorStyle = .none
        ZBNetworkTool.loadMyCellData { (sections) in
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = ZBMyCellModel.deserialize(from: string)
            var myConcerns = [ZBMyCellModel]()
            myConcerns.append(myConcern!)
            self.sections.append(myConcerns)
            self.sections += sections
            self.tableView.reloadData()
        }
    }
}

extension MineViewController {
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 :10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH , height: SCREEN_HEIGHT));
        headView.backgroundColor = UIColor.gloablBackgroundColor()
        return headView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ZBMyOtherCell.self)) as! ZBMyOtherCell
 
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}
