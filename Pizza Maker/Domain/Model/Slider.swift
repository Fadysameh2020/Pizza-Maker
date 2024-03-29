//
//  Slider.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

struct Slider: Decodable {
    var id: Int
    var image: URL
    var buttonTitle: String
    var product: Product
    
    enum CodingKeys: String, CodingKey {
        case id, image, product
        case buttonTitle = "button_title"
        
    }
    
}
