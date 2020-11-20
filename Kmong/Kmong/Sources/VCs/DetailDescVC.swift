//
//  DetailOptionVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailDescVC: UIViewController, IndicatorInfoProvider, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var CardCollectionViewCell: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = CardCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
        
        return cell
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "서비스 설명")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    lazy var collectionView : UICollectionView = {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10

            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = .white
            cv.delegate = self
            cv.dataSource = self
//            cv.register(CardCollectionViewCell.self, forCellWithReuseIdentifier:"CardCollectionViewCell")
            cv.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            cv.showsHorizontalScrollIndicator = false
            cv.translatesAutoresizingMaskIntoConstraints = false
            
                    
            return cv
        }()

}
