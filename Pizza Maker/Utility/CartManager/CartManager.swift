//
//  CartManager.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

class CartManager {
    static var shared = CartManager()
    
    private var items: BehaviorRelay<[CartItem]> = .init(value: [])
    var itemsObservable: Observable<[CartItem]>

    init() {
        itemsObservable = items.asObservable()
    }
    
    func addProduct(product: Product, notes: String? = nil) {
        // Detect if product is found, then increase quantity
        if let productIndex = items.value.firstIndex(where: { (item) in
            item.product.title == product.title
        }){
            var dataCopy = items.value
            dataCopy[productIndex].product.quantity += 1
            items.accept(dataCopy)
            
            return
        }
        
        // Detect if product is not found, then add it
        let cartItem = convertProductToCartItem(product, notes: notes)
//        cartItem.quantity = quantity
        var newData = items.value
        newData.append(cartItem)
        items.accept(newData)
    }
    
    var totalCost: Double {
        var totalCost: Double = 0
        for item in items.value {
            //            totalCost += item.product.price * Double(item.quantity)
//            totalCost += 10 * Double(item.quantity)
            totalCost += item.product.price * Double(item.product.quantity)
        }
        
        return totalCost
    }
    
    var itemsCount: Int {
        var itemsCount: Int = 0
        for item in items.value {
            itemsCount += item.product.quantity
        }
        
        return itemsCount

    }
    
    private func convertProductToCartItem(_ product: Product, notes: String? = nil) -> CartItem{
        return .init(product: product, notes: notes)
    }
    
    
}
