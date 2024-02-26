//
//  PopularItemViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

class PopularItemViewModel {
    var title: String
    var subTitle: String
    var rating: Int
    var category: String
    var cookTime: String
//    var image: String

    init(_ product: Product) {
        self.title = product.title
        self.subTitle = product.ingredients
        self.rating = product.rating
        self.category = product.category
        self.cookTime = product.cookTime
//        self.image = product.image
    }
    
}
