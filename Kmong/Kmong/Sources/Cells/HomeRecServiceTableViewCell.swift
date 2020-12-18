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
    var experts : [Service] = []
    var vcHere : HomeVC?
    var expertTypes : [HomeExpertData] = []
       
    override func awakeFromNib() {
        super.awakeFromNib()
        ServiceCollectionView.delegate = self
        ServiceCollectionView.dataSource = self
        callHomeAuthService(index: 0)
    }
    
    func callHomeAuthService(index : Int) {
        HomeAuthService.shared.homeRecService() { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let homeRecommendData = data as? [HomeExpertData] {
                    self.expertTypes = homeRecommendData
                    
                    if index == 0 {
                        self.experts = homeRecommendData[0].services
                    }
                    if index == 1 {
                        self.experts = homeRecommendData[1].services
                    }
                    
                    DispatchQueue.main.async{
                        self.ServiceCollectionView.reloadData()
                    }
                }
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setCell(type : ExpertType) {
        serviceType.text = "\(type.type) 추천 서비스"
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
        
        cell.setData(description: experts[indexPath.item].title, url: experts[indexPath.item].image, star: experts[indexPath.item].star, review: experts[indexPath.item].review)
        
        cell.layer.borderColor = CGColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 8.0

        return cell
        
    }
}

extension HomeRecServiceTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        
        if let dvc = storyboard.instantiateViewController(identifier: "DetailNavigation") as? UINavigationController {
            dvc.modalPresentationStyle = .fullScreen
            self.vcHere?.present(dvc,animated: true)
            
        }
    }
}
