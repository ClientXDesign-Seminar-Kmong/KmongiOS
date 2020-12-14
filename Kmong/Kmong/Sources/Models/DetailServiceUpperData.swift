//
//  DetailServiceUpperData.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/14.
//

import Foundation

struct Empty: Codable {
    
    var status: Int
    var message: String
    var data: ServiceUpperData
}

struct ServiceUpperData: Codable {
    let title: String
    let id, star, review, heart: Int
    let price: Int
    let layer: String
    let serviceImgs: [String]

    enum CodingKeys: String, CodingKey {
        case title, id, star, review, heart, price, layer
        case serviceImgs = "ServiceImgs"
    }
}
