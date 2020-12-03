//
//  HomeExpert.swift
//  Pods
//
//  Created by DANNA LEE on 2020/11/29.
//

import UIKit

struct Expert {
    var expertImageName : String
    var description : String
    var reviewCount : Int
    var star : Float
    
    func makeExpertImage() -> UIImage? {
        return UIImage(named: expertImageName)
    }
}
