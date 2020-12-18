//
//  HomeAPIConstants.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/10.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.146.22:3000"
    
    static let homeBannerURL = baseURL + "/banner"
    
    //서비스 상단
    static let serviceUpperURL = baseURL + "/service/5"

    //서비스 설명
    static let detailDescriptionURL = baseURL + "/service/5/description"
    
    //비슷한 서비스
    static let similarServiceURL = baseURL + "/service/5/similar"
    
    //Like Btn
    static let likeBtnURL = baseURL + "/service/5/like"

    //서비스 옵션
    static let serviceOptionURL = baseURL + "/service/5/option"
  
    //전문가 정보
    static let serviceExpertURL = baseURL + "/service/5/expert"

}
