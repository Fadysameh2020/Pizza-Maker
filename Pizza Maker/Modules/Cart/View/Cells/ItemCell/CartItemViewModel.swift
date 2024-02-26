//
//  CartItemViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

class CartItemViewModel {
    
    let topString: String
    let notesString: String
    let price: String
    
    init(_ cartItem: CartItem) {
        let quantity = cartItem.product.quantity
        self.topString = "\(cartItem.product.title) x \(quantity)"
        if let notes = cartItem.notes{
            self.notesString = "Notes: \(notes)"
        }else{
            self.notesString = "Notes: No Notes"
        }
        self.price = "\(cartItem.product.price)"
    }
    
    
}
