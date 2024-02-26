//
//  ResponseObject.swift
//  Pizza Maker
//
//  Created by MESHO on 26/02/2024.
//

import Foundation

struct ResponseObject<T: Decodable>: Decodable {
    var message: String
    var status: Bool
    var data: T
}


struct ResponsePaginationObject<T: Decodable>: Decodable {
    var message: String
    var status: Bool
    var data: T
    var pageId: Int
}
