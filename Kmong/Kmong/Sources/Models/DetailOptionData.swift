//
//  DetailOptionData.swift
//  Kmong
//
//  Created by 이예슬 on 2020/12/17.
//

import Foundation

struct DetailOptionData: Codable {
    var subContent: [String]
    var title, content: String?
    var deadline, edit, price: Int
}
