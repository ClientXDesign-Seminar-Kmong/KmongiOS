//
//  SimilarServiceCVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/12/16.
//

import UIKit

class SimilarServiceCVC: UICollectionViewCell {
    static let identifier = "SimilarServiceCVC"
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setSimilarService(imageName: String, title: String, star: String, review: String, price: String) {
        
        headerImage.image = UIImage(named: imageName)
        titleLabel.text = title
        starLabel.text = star
        reviewLabel.text = review
        priceLabel.text = price
    }
}
