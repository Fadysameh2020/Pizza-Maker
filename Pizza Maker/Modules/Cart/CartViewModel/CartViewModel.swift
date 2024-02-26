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
    var cartHeaderDidChangeObservable: Observable<CartHeaderViewModel> { get }
    func bind()
}

protocol CartViewModelProtocol: ViewModelProtocol, CartViewModelInputs, CartViewModelOutputs {
    var input: CartViewModelInputs { get }
    var output: CartViewModelOutputs { get }
}

class CartViewModel: CartViewModelProtocol {
    private var cartItems: BehaviorRelay<[CartItemViewModel]> = .init(value: [])
    
    private var cartHeader: PublishSubject<CartHeaderViewModel> = .init()
    
    let disposeBag = {
       return DisposeBag()
    }()
        
    var input: CartViewModelInputs {
        return self
    }
    var output: CartViewModelOutputs {
        return self
    }
    
    //outputs
    var cartHeaderDidChangeObservable: Observable<CartHeaderViewModel>
    var cartItemObservable: Observable<[CartItemViewModel]>
    
    var cartHeaderViewModel: CartHeaderViewModel?
    
    init() {
        cartHeaderDidChangeObservable = cartHeader.asObservable()
        cartItemObservable = cartItems.asObservable()
        bind()
    }
    
    func bind(){
        CartManager.shared.itemsObservable.subscribe { [weak self] (items) in
            guard let self = self else { return }
            let mappedItems = items.map(CartItemViewModel.init)
            self.cartHeaderViewModel = .init()
            self.cartHeader.onNext(cartHeaderViewModel!)
            self.cartItems.accept(mappedItems)
        }.disposed(by: disposeBag)
    }
    
}
