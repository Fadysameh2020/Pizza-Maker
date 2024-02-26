//
//  CartViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 24/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol CartViewModelInputs {
    
}

protocol CartViewModelOutputs {
    var cartItemObservable: Observable<[CartItemViewModel]> { get }
}

protocol CartViewModelProtocol: ViewModelProtocol, CartViewModelInputs, CartViewModelOutputs {
    var input: CartViewModelInputs { get }
    var output: CartViewModelOutputs { get }
}

class CartViewModel: CartViewModelProtocol {
    private var cartItems: BehaviorRelay<[CartItemViewModel]> = .init(value: [
        .init(.init(product: .init(title: "Product", rating: 5, price: 22.5), notes: "Notes")),
        .init(.init(product: .init(title: "Product", rating: 5, price: 22.5), notes: "Notes")),
        .init(.init(product: .init(title: "Product", rating: 5, price: 22.5), notes: "Notes")),
    ])
    
    
    var input: CartViewModelInputs {
        return self
    }
    var output: CartViewModelOutputs {
        return self
    }
    
    //outputs
    var cartItemObservable: Observable<[CartItemViewModel]>
    
    init() {
        cartItemObservable = cartItems.asObservable()
    }
    
}
