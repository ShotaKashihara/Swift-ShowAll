//
//  CustomButton.swift
//  CollectionInTable
//
//  Created by Shota Kashihara on 2017/04/12.
//  Copyright © 2017年 Lonely Box. All rights reserved.
//

import UIKit

/// http://qiita.com/Kta-M/items/ae22fd0c78cb15faee0b
@IBDesignable class CustomButton: UIButton {
    
    // 角丸の半径(0で四角形)
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    // 枠
    @IBInspectable var borderColor: UIColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        // 角丸
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        // 枠線
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        
        super.draw(rect)
    }
}
