//
//  DetailExpertData.swift
//  Kmong
//
//  Created by 이예슬 on 2020/12/18.
//

import Foundation

struct DetailExpertData: Codable {
    var id: Int
    var name, connection: String
    var workCnt, satisfaction, responseTime: Int
    var membership: String
}
