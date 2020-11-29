//
//  HomeRecommendedServiceCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/29.
//

import UIKit

class HomeRecommendedServiceCell: UICollectionViewCell {
    
    static let identifier = "HomeRecommendedServiceCell"
    
    @IBOutlet var ExpertPhoto: UIImageView!
    @IBOutlet var expertDescription: UILabel!
    @IBOutlet var expertReview: UILabel!
    
    func setImage (imageName : String) {
        ExpertPhoto.image = UIImage(named: imageName)
    }
    
}
