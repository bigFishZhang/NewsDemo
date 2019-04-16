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
    var concerns = [ZBMyConcern]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏多余的cell
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.gloablBackgroundColor()
        tableView.zb_registerCell(cell: ZBMyFirstSectionCell.self)
        tableView.zb_registerCell(cell: ZBMyOtherCell.self)
        tableView.separatorStyle = .none
        tableView.tableHeaderView = headerView
        ZBNetworkTool.loadMyCellData { (sections) in
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = ZBMyCellModel.deserialize(from: string)
            var myConcerns = [ZBMyCellModel]()
            myConcerns.append(myConcern!)
            self.sections.append(myConcerns)
            self.sections += sections
            self.tableView.reloadData()
            ZBNetworkTool.loadMyConcern(completionHandler: { (concerns) in
                self.concerns = concerns;
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            })
        }
    }
    
    fileprivate lazy var headerView:ZBNoLoginHeaderView = {
        let headerView = ZBNoLoginHeaderView.headerView()
        return headerView
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0  && indexPath.row == 0{
            return (concerns.count == 0 || concerns.count ==  1) ?  40 : 114
        }
        return 40
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.zb_dequeueReusableCell(indexPath: indexPath) as ZBMyFirstSectionCell
            let section = sections[indexPath.section]
            cell.mycellModel = section[indexPath.row]
            if concerns.count == 0 || concerns.count == 1 {
                cell.collectionView.isHidden = true
            }
            if concerns.count == 1 {
                cell.myConcern = concerns[0]
            }
            if concerns.count > 1 {
                cell.myConcerns = concerns
            }
            
            return cell
        }
        
        let cell = tableView.zb_dequeueReusableCell(indexPath: indexPath) as ZBMyOtherCell
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.leftLabel.text = myCellModel.text
        cell.rightLabel.text = myCellModel.grey_text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            let totalOffset = HEADER_VIEW_HEIGHT + abs(offsetY)
            let f = totalOffset / HEADER_VIEW_HEIGHT
            headerView.bgImageView.frame = CGRect(x: -SCREEN_WIDTH * (f - 1) * 0.5, y: offsetY, width: SCREEN_WIDTH * f, height: totalOffset)
        }
    }
    
    
    
    

}
