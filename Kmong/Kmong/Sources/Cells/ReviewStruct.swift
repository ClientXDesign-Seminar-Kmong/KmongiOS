//
//  ReviewStruct.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/03.
//

import UIKit

struct Review {
    var id : String
    var date : String
    var service : String
    var review : String
    var star : Int
    
    func hideID(id : String) -> String {

        var id = id.map { String($0) }
        
        id[id.count-1] = "*"
        id[id.count-2] = "*"
        id[id.count-3] = "*"
        
        return id.joined()
    }

}
