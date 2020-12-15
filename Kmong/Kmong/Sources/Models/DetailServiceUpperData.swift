//
//  DetailServiceUpperData.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/14.
//

import Foundation

struct ServiceUpperData: Codable {
    var title: String
    var id, star, review, heart: Int
    var price: Int
    var layer: String
    var serviceImgs: [ServiceImg]
    
    enum CodingKeys: String, CodingKey {
            case title, id, star, review, heart, price, layer
            case serviceImgs = "ServiceImgs"
        }
}

struct ServiceImg: Codable {
    var id: Int
    var img: String
}
