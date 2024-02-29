//
//  Product.swift
//  Pizza Maker
//
//  Created by MESHO on 19/02/2024.
//

import Foundation

//struct Product: Decodable{
//    let title: String
//    let rating: Int
//    let price: Double
//}

struct Product: Decodable {
    let id: Int
    let title, productDescription: String
    let image: String
    let category, cookTime: String
    let rating: Int
    let ingredients: String
    let sizes: [Size]
    
    var quantity: Int = 1 // to be removed
    var price: Double = 0.0 // to be removed


    enum CodingKeys: String, CodingKey {
        case id, title
        case productDescription = "description"
        case image, category
        case cookTime = "cook_time"
        case rating, ingredients, sizes
    }
}
