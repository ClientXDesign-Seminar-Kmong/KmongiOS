//
//  HomeRecServiceTableViewCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/29.
//

import UIKit

class HomeRecServiceTableViewCell: UITableViewCell, UICollectionViewDelegate {

    static let identifier = "HomeRecServiceTVC"
    
    @IBOutlet var serviceType: UILabel!
    @IBOutlet var ServiceCollectionView: UICollectionView!
    
    var ServiceCells : [String] = ["디자인", "프로그래밍"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ServiceCollectionView.delegate = self
        ServiceCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeRecServiceTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendedServiceCell.identifier, for: indexPath) as? HomeRecommendedServiceCell else {
            return UICollectionViewCell()
        }
        cell.setImage(imageName: "designerMinju")
        
        cell.layer.borderColor = CGColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8.0
        
        return cell
    }
}

extension HomeRecommendedServiceCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 11, left: 20, bottom: 16, right: 20)
    }
}
