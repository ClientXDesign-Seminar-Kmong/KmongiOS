//
//  HomeExpertRec.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/16.
//

import Foundation

// MARK: - HomeExpertData
struct HomeExpertData: Codable {
    let id: Int
    let part: String
    let services: [Service]

    enum CodingKeys: String, CodingKey {
        case id, part
        case services = "Services"
    }
}

// MARK: - Service
struct Service: Codable {
    let id: Int
    let title: String
    let star: Int
    let image: String
    let review: Int
}
