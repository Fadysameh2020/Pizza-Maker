//
//  Size.swift
//  Pizza Maker
//
//  Created by MESHO on 22/02/2024.
//

import Foundation

// MARK: - Size
struct Size: Decodable {
    let id: Int
    let size: String
    let slices: Int
    let price: Double
}
