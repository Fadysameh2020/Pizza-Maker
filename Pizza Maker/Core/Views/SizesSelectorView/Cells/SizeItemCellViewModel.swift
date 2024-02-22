//
//  SizeItemCellViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 22/02/2024.
//

import Foundation

struct SizeItemCellViewModel {
    var topString: String
    
    init(size: Size, showPrice: Bool) {
        self.topString = size.size
    }
}
