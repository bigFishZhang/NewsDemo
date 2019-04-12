//
//  ZBMyFirstSectionCell.swift
//  News
//
//  Created by bigfish on 2019/4/12.
//  Copyright © 2019 zzb. All rights reserved.
//

import UIKit

class ZBMyFirstSectionCell: UITableViewCell,RegisterCellFromNib {
    
    /// 标题
    @IBOutlet weak var leftLabel: UILabel!
    /// 副标题
    @IBOutlet weak var rightLabel: UILabel!
    /// 箭头
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var myConcerns = [ZBMyConcern]()
    {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    var mycellModel:ZBMyCellModel? {
        didSet{
            leftLabel.text = mycellModel?.text
            rightLabel.text = mycellModel?.grey_text
        }
    }
    var myConcern:ZBMyConcern? {
        didSet{
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        collectionView.collectionViewLayout = MyConcernFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.zb_registerCell(cell: ZBConcernCell.self)
        // Configure the view for the selected state
    }
    
}

extension ZBMyFirstSectionCell:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.zb_dequeueReusableCell(indexPath: indexPath) as ZBConcernCell
        cell.myConcern = myConcerns[indexPath.row]
        return cell
    }
    
}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        //每个cell的大小
        itemSize = CGSize(width: 58, height: 74)
        //横向间距
        minimumLineSpacing  = 0
        //纵向间距
        minimumInteritemSpacing = 0
        //cell上下左右边距
        sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        //设置水平滚动
        scrollDirection = .horizontal

    }
}
