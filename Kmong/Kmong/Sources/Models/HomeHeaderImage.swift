//
//  HomeHeaderImage.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/10.
//

import Foundation

struct HomeHeaderImage: Codable {
    var id : Int
    var image : [BannerImg]
    
//    func urlToImage(url : String) -> UIImage {
//        let data = try Data(contentsOf: URL(string: url) ?? "")
//
//    }
}

struct BannerImg: Codable {
    var id : Int
    var img : String
}
