//
//  DetailVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/15.
//

import UIKit
import XLPagerTabStrip

class DetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        headerImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.identifier, for: indexPath) as? HeaderCell else {
            
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var pageNumberView: UIView!
    @IBOutlet weak var inquiryView: UIButton!
    @IBOutlet weak var purchaseView: UIButton!
    @IBOutlet weak var smallHeartView: UIButton!
    @IBOutlet weak var currentPage: UILabel!
    @IBOutlet weak var heartView: UIButton!
    
    var headerImages: [String] = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        
        setInitLayout()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }

    func setInitLayout() {
        
        pageNumberView.layer.cornerRadius = 9
        
        inquiryView.layer.borderColor = UIColor.systemGray2.cgColor
        inquiryView.layer.borderWidth = 1
        inquiryView.layer.cornerRadius = 6
        
        purchaseView.layer.cornerRadius = 6
        
        heartView.layer.borderColor = UIColor.systemGray2.cgColor
        heartView.layer.borderWidth = 1
        heartView.layer.cornerRadius = 6
    }
    
    @IBAction func heartBtn(_ sender: Any) {
       
        
    }
}

extension DetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
}

//extension DetailVC: IndicatorInfoProvider {
//
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//
//        return IndicatorInfo(title: "서비스 설명")
//    }
//}
