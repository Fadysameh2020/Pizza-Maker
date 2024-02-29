//
//  PizzaCategoryItemViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import Foundation

class PizzaCategoryItemViewModel {
    let imageUrl: URL?
    let name: String
    
    init(_ category: PizzaItem) {
        self.imageUrl = URL(string: category.image)
        self.name = category.name
    }
}
