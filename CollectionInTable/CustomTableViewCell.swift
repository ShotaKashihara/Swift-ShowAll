//
//  CollectionCell.swift
//  CollectionInTable
//
//  Created by Adi Nugroho on 2/22/17.
//  Copyright © 2017 Lonely Box. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showAllButton: CustomButton!
    @IBOutlet weak var selectAllButton: CustomButton!
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CustomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(Constant.totalItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BoxCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "BoxCellHeader", for: indexPath)
            return header
        default:
            return UICollectionReusableView.init()
        }
    }
}

extension CustomTableViewCell: UICollectionViewDelegateFlowLayout {
    
    /// セルのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemWidth = Constant.getItemWidth(boundWidth: collectionView.bounds.size.width)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    /// セルの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(
            Constant.offset,    // top
            Constant.offset,    // left
            Constant.offset,    // bottom
            Constant.offset     // right
        )
    }
    
    /// 行間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constant.minLineSpacing
    }
    
    /// 列間の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constant.minItemSpacing
    }
    
    /// セクションごとのヘッダサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: collectionView.bounds.size.width, height: Constant.boxCellHeaderHeight)
    }
    
    /// セクションのフッタサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: 0, height: 0)
    }
}
