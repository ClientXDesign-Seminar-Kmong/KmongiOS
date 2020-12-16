//
//  HomeAPIConstants.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/10.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.146.22:3000"
    
    //홈 상단 배너
    static let homeBannerURL = baseURL + "/banner"
    
    //홈 하단 추천 서비스
    static let homeRecServiceURL = baseURL + "/recommend"
    
    //서비스 상단
    static let serviceUpperURL = baseURL + "/service/5"
}
