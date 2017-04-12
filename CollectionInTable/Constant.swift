//
//  Constant.swift
//  CollectionInTable
//
//  Created by Adi Nugroho on 2/22/17.
//  Copyright © 2017 Lonely Box. All rights reserved.
//

import UIKit

class Constant {
    
    static let headerHeihgt: CGFloat = 40
    static let footerHeight: CGFloat = 40
    static let boxCellHeaderHeight: CGFloat = 25
    
    static let totalItem: CGFloat = 11
    
    static let column: CGFloat = 4
    
    static let minLineSpacing: CGFloat = 1.0
    static let minItemSpacing: CGFloat = 1.0
    
    static let offset: CGFloat = 1.0 // TODO: for each side, define its offset
    
    static func getItemWidth(boundWidth: CGFloat) -> CGFloat {
        
        let totalWidth = boundWidth - (offset + offset) - ((column - 1) * minItemSpacing)
        
        return totalWidth / column        
    }
}
