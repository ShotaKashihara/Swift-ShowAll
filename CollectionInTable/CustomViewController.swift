//
//  ViewController.swift
//  CollectionInTable
//
//  Created by Adi Nugroho on 2/22/17.
//  Copyright © 2017 Lonely Box. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    var isShowAlls: [Bool] = [false, false, false]
    var isSelectAlls: [Bool] = [false, false, false]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CustomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isShowAlls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        // テキストの変更
        if isShowAlls[indexPath.row] {
            cell.showAllButton.setTitle("△閉じる", for: .normal)
        } else {
            cell.showAllButton.setTitle("▽すべて見る", for: .normal)
        }
        if isSelectAlls[indexPath.row] {
            cell.selectAllButton.setTitle("✓すべて選択解除", for: .normal)
        } else {
            cell.selectAllButton.setTitle("✓すべて選択", for: .normal)
        }

        return cell
    }
}

extension CustomViewController: UITableViewDelegate {
    
    // 高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let itemHeight = Constant.getItemWidth(boundWidth: tableView.bounds.size.width)
        
        var totalRow: CGFloat = 0
        if self.isShowAlls[indexPath.row] {
            totalRow = ceil(Constant.totalItem / Constant.column)
        } else {
            totalRow = 2
        }
        
        let totalTopBottomOffset = Constant.offset + Constant.offset
        
        let totalSpacing = CGFloat(totalRow - 1) * Constant.minLineSpacing
        
        let totalHeight  = ((itemHeight * CGFloat(totalRow)) + totalTopBottomOffset + totalSpacing)
            + Constant.headerHeihgt + Constant.footerHeight + Constant.boxCellHeaderHeight
        
        return totalHeight
    }
}

extension CustomViewController {
    
    @IBAction func tappedShowAll(_ sender: Any) {
        
        // 押されたボタンを取得
        let button = sender as! UIButton
        
        // クリックされたcellの位置(indexPath)を取得
        if let cell = button.superview?.superview?.superview?.superview as? CustomTableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            // 状態を記憶
            isShowAlls[indexPath.row] = !isShowAlls[indexPath.row]
            // 行の再描画(高さが再設定される)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}
