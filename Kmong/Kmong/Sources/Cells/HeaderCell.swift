//
//  HeaderCell.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/15.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    static let identifier = "HeaderCell"
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    func setImage(imageName: String) {
        headerImageView.image = UIImage(named: imageName)
    }
}
