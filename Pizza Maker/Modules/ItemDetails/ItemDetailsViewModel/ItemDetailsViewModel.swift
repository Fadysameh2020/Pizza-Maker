//
//  ItemDetailsViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 20/02/2024.
//

import Foundation
import RxSwift
import RxCocoa

protocol ItemDetailsViewModelOutputProtocol {
    var displayMainData: PublishSubject<ProductViewModel> { get set }
}

protocol ItemDetailsViewModelInputProtocol {
    func viewDidLoad()
    func didPressAddToCart()
}

protocol ItemDetailsViewModelProtocol: ViewModelProtocol, ItemDetailsViewModelInputProtocol, ItemDetailsViewModelOutputProtocol {}

class ItemDetailsViewModel: ItemDetailsViewModelProtocol {
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    //outputs
    var displayMainData: PublishSubject<ProductViewModel> = .init()
    
    
    //inputs
    func viewDidLoad() {
        let productViewModel = ProductViewModel(product)
        displayMainData.onNext(productViewModel)
    }
    
    func didPressAddToCart() {
        CartManager.shared.addProduct(product: product)
    }
    
    
}
