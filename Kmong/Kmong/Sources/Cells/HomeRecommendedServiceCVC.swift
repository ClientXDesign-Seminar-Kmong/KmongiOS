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
    
    func setData (description : String, url : String, star : Int, review : Int) {
        
        expertDescription.text = description
        ExpertPhoto.imageFromUrl(url)
        expertReview.text = "\(String(format: "%d.0", star)) | \(String(review))개의 평가"
    }
    
}
