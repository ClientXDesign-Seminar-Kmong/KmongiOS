//
//  HomeHeaderCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/02.
//

import UIKit

class HomeHeaderCVC: UICollectionViewCell {
    static let identifier = "HomeHeaderCVC"
    
    @IBOutlet var headerImageView: UIImageView!
    
    func setImage(imageName: String) {
        
        headerImageView.image = UIImage(named: imageName)
    }
    
}
