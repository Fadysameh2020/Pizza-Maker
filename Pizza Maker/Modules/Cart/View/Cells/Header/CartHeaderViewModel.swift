//
//  CartHeaderViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

class CartHeaderViewModel {
    
    let itemsCount: String
    let totalCost: String
    
    init() {
        let count = CartManager.shared.itemsCount
        
        switch count {
        case 0:
            self.itemsCount = "No Items"
        case 1:
            self.itemsCount = "\(count) Item"
        default:
            self.itemsCount = "\(count) Items"
        }

        self.totalCost = "$\(CartManager.shared.totalCost)"
    }
    
    
}
