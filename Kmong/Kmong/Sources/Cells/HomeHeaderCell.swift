//
//  HomeHeaderCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/02.
//

import UIKit

class HomeHeaderCVC: UICollectionViewCell {
    static let identifier = "HomeHeaderCell"
    
    @IBOutlet var headerImageView: UIImageView!
    
    func setImage(imageName: String) {
        
        headerImageView.image = UIImage(named: imageName)
    }
    
}
