//
//  DetailDescriptionData.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/16.
//

import Foundation

struct DetailDescriptionData: Codable {
    var id: Int
    var dataDescription: String
    
    enum CodingKeys: String, CodingKey {
            case id
            case dataDescription = "description"
        }
}
