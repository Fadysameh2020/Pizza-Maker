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
}

class ItemDetailsViewModel: ViewModelProtocol, ItemDetailsViewModelInputProtocol, ItemDetailsViewModelOutputProtocol {
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    //inputs
    func viewDidLoad() {
        let productViewModel = ProductViewModel(product)
        displayMainData.onNext(productViewModel)
    }
    
    //outputs
    var displayMainData: RxSwift.PublishSubject<ProductViewModel> = .init()
    
}
