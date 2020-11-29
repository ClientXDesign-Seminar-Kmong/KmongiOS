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
    var review : String
    
    func makeExpertImage() -> UIImage? {
        return UIImage(named: expertImageName)
    }
}
