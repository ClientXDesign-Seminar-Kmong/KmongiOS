//
//  DetailHeaderImage.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/01.
//

import UIKit

struct HeaderImages {
    
    var headerImage: String
    
    func makeHeaderImage() -> UIImage? {
        
        return UIImage(named: headerImage)
    }
}
