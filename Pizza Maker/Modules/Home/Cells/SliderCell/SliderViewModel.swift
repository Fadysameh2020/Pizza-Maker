//
//  SliderViewModel.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

class SliderViewModel {
    var title: String
    var buttonTitle: String
    var rating: Int
    var category: String
    var cookTime: String
//    var image: String

    init(_ slider: Slider) {
        self.buttonTitle = slider.buttonTitle
        self.title = slider.product.title
        self.rating = slider.product.rating
        self.category = slider.product.category
        self.cookTime = slider.product.cookTime
        
    }
    
}
