//
//  HomeRecommendedServiceCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/29.
//

import UIKit

class HomeRecommendedServiceCVC: UICollectionViewCell {
    
    static let identifier = "HomeRecommendedServiceCell"
    
    @IBOutlet var ExpertPhoto: UIImageView!
    @IBOutlet var expertDescription: UILabel!
    @IBOutlet var expertReview: UILabel!
    
    func setData (expert : Expert) {
        expertDescription.text = expert.description
        ExpertPhoto.image = expert.makeExpertImage()
        expertReview.text = "\(String(format: "%.1f", expert.star)) | \(String(expert.reviewCount))개의 평가"
    }
    
}
