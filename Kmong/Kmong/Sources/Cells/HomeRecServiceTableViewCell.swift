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
    var designExperts : [Expert] = []
    var programmingExperts : [Expert] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ServiceCollectionView.delegate = self
        ServiceCollectionView.dataSource = self
        setDesignerData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(type : ExpertType) {
        serviceType.text = "\(type.type) 추천 서비스"
    }
    
    func setDesignerData() {
        designExperts.append(contentsOf: [
            Expert(expertImageName: "designerMinju", description: "사랑받는 디자이너로 성장하는 방법 알려드립니다.", reviewCount: 152, star: 5.0),
            Expert(expertImageName: "designerMinju", description: "절대 실패없는 유튜브 영상 촬영 방법에 대해 알려드립니다.", reviewCount: 86, star: 5)
        ])
    }
    

}

extension HomeRecServiceTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return designExperts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendedServiceCell.identifier, for: indexPath) as? HomeRecommendedServiceCell else {
            return UICollectionViewCell()
        }
        cell.setData(expert: designExperts[indexPath.item])
        
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
