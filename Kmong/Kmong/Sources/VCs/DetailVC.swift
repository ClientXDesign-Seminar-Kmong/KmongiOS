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
    @IBOutlet weak var scrollView: UIScrollView!
    
    var headerImages: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        scrollView.delegate = self
        
        setInitLayout()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

//       바 바턴 아이템 흰 색으로
        navigationController?.navigationBar.tintColor = .white
        
//       타이틀 컬러 있으면 흰색으로 바꾸기
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        //status bar 높이 가져오기
        if #available(iOS 13.0, *) {
            
            statusBarFrame = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            
            // Fallback on earlier versions
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
                
        //흰 텍스트 스테이터스 바
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        //initial status bar만들기 나중에 바뀜
        statusBarView = UIView(frame: statusBarFrame)
        statusBarView.isOpaque = false
        statusBarView.backgroundColor = .clear
        view.addSubview(statusBarView)
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
    
    // Like Button설정
    var bRec:Bool = true
    
    @IBAction func heartBtn(_ sender: Any) {
       
        bRec = !bRec
        if bRec {
            heartView.setImage(UIImage(named: "icLikeSelected"), for: .normal)
            heartView.layer.borderColor = UIColor.yellow.cgColor
            heartView.layer.borderColor = UIColor(red: 249/255, green: 212/255, blue: 72/255, alpha: 1).cgColor
        } else {
            heartView.setImage(UIImage(named: "icLikeUnselected"), for: .normal)
            heartView.layer.borderColor = UIColor.systemGray2.cgColor
        }
    }
    
    @IBAction func smallHeartBtn(_ sender: Any) {
        
        bRec = !bRec
        if bRec {
            smallHeartView.setImage(UIImage(named: "icLikeUnselected2"), for: .normal)
        } else {
            smallHeartView.setImage(UIImage(named: "icLikeUnselected2"), for: .normal)
        }
    }
    
    var statusBarFrame: CGRect!
        var statusBarView: UIView!
        var offset: CGFloat!
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let targetHeight = headerCollectionView.bounds.height - (navigationController?.navigationBar.bounds.height)! - statusBarFrame.height
                
        // targetHeight에 맞춰 얼마나 스크롤 됐는지 계산
        offset = scrollView.contentOffset.y / targetHeight
                
        print(String(describing: targetHeight), String(describing: offset))
                
        //오프셋 1로 만들기
        if offset > 1 {
            offset = 1
        }
                
        //절반내려오면 백그라운드 색깔 바꾸기
        // 스테이터스 바 정보에만 영향미침 DOES NOT affect the background color.
        if offset > 0.5 {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.default
            
        } else {
            self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        }
                
        // 오프셋에 맞춰 바뀔 색깔 저장
        let clearToWhite = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        let whiteToBlack = UIColor(hue: 1, saturation: 0, brightness: 1-offset, alpha: 1 )
                
        // 스크롤 시 아이템 색상 변경
        self.navigationController?.navigationBar.tintColor = whiteToBlack
        // 스크롤 시 타이틀 색상 변경
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : whiteToBlack]
        
        // 스크롤 시 네비 바 백그라운드 색상 변경
        self.navigationController?.navigationBar.backgroundColor = clearToWhite
        
        // 스크롤 시 스테이터스 바 백드라운드 색상 변경
        statusBarView!.backgroundColor = clearToWhite
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
}
