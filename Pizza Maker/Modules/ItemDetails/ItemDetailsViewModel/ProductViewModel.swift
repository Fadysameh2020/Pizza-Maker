//
//  ProductViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 20/02/2024.
//

import Foundation

class ProductViewModel {
    let mainTitle: String
    
    init(_ product: Product) {
        self.mainTitle = product.title
    }
    
}
