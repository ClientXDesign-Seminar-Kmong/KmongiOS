//
//  HeaderCell.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/15.
//

import UIKit

class DetailHeaderCell: UICollectionViewCell {
    
    static let identifier = "DetailHeaderCell"
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    func setCell(headerImage: HeaderImages) {
        
        headerImageView.image = headerImage.makeHeaderImage()
    }
}
