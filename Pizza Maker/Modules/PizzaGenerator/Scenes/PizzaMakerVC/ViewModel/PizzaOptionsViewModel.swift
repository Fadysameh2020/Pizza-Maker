//
//  PizzaOptionsViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 29/02/2024.
//

import Foundation

class PizzaOptionsViewModel {
    var pizzaName: String
    
    init(_ pizzaOptions: PizzaOptions) {
        self.pizzaName = pizzaOptions.name ?? ""
    }
}
