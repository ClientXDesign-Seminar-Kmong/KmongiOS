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
    var experts : [Expert] = []
    var naviHere : UINavigationController?
    //    var programmingExperts : [Expert] = []
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ServiceCollectionView.delegate = self
        ServiceCollectionView.dataSource = self
        setDesignerData()
        setProgrammerData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func setCell(type : ExpertType) {
        serviceType.text = "\(type.type) 추천 서비스"
    }
    
    func setDesignerData() {
        experts = [
            Expert(expertImageName: "designerMinju", description: "사랑받는 디자이너로 성장하는 방법 알려드립니다.", reviewCount: 152, star: 5.0),
            Expert(expertImageName: "mediaHanwool", description: "절대 실패없는 유튜브 영상 촬영 방법에 대해 알려드립니다.", reviewCount: 86, star: 5)
        ]
    }
    
    func setProgrammerData() {
        experts = [
            Expert(expertImageName: "androidMing", description: "안드로이드의 “모든 것”에 대해서 알려드립니다.", reviewCount: 126, star: 5.0),
            Expert(expertImageName: "serverYH", description: "iOS, 애플 감성 살려서 개발하는 방법을 스윗하게 알려드립니다.", reviewCount: 126, star: 5)
        ]
    }
    
    
}

extension HomeRecServiceTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return experts.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendedServiceCVC.identifier, for: indexPath) as? HomeRecommendedServiceCVC else {
            return UICollectionViewCell()
        }
        
        cell.setData(expert: experts[indexPath.item])
        
        cell.layer.borderColor = CGColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8.0

        return cell
        
    }
}

extension HomeRecServiceTableViewCell: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
//                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 12
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 11, left: 20, bottom: 16, right: 20)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        
        if let dvc = storyboard.instantiateViewController(identifier: "DetailVC") as? DetailVC {
            self.naviHere?.pushViewController(dvc, animated: true)
            
        }
    }
}
