//
//  HomeTableViewHeaderCell.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/29.
//

import UIKit

class HomeTableViewHeaderCell: UITableViewCell {
    
    static let identifier = "HomeTableViewHeaderCell"

    @IBOutlet var headerCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerCollectionView.dataSource = self
        headerCollectionView.delegate = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBAction func TouchUpDesign(_ sender: Any) {
    }
    @IBAction func TouchUpTranslate(_ sender: Any) {
    }
    @IBAction func TouchUpConsult(_ sender: Any) {
    }
    @IBAction func TouchUpIT(_ sender: Any) {
    }
    @IBAction func TouchUpWriting(_ sender: Any) {
    }
    @IBAction func TouchUpLesson(_ sender: Any) {
    }
    @IBAction func TouchUpVideo(_ sender: Any) {
    }
    @IBAction func TouchUpBusiness(_ sender: Any) {
    }
    @IBAction func TouchUpDIY(_ sender: Any) {
    }
    @IBAction func TouchUpMarketing(_ sender: Any) {
    }
    @IBAction func TouchUpCareer(_ sender: Any) {
    }
    @IBAction func TouchUpEbook(_ sender: Any) {
    }
}

extension HomeTableViewHeaderCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.identifier, for: indexPath) as? HomeHeaderCell else {
            return UICollectionViewCell()
        }
        cell.setData(imageName: "homeCard2")
        
        return cell
    }
}

extension HomeTableViewHeaderCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
