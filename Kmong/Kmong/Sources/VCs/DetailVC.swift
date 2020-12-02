//
//  DetailVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/15.
//

import UIKit
import XLPagerTabStrip
import InfiniteCarouselCollectionView

class DetailVC: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)

        cell.layer.borderColor = UIColor.systemGray2.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    @IBOutlet weak var headerCollectionView: CarouselCollectionView!
    @IBOutlet weak var pageNumberView: UIView!
    @IBOutlet weak var inquiryView: UIButton!
    @IBOutlet weak var purchaseView: UIButton!
    @IBOutlet weak var smallHeartView: UIButton!
    @IBOutlet weak var currentPage: UILabel!
    @IBOutlet weak var heartView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var headerImages: [HeaderImages] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cardFlowLayout = UICollectionViewFlowLayout()
        
        cardFlowLayout.itemSize = CGSize(width: 200, height: 223)
        cardFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cardFlowLayout.minimumInteritemSpacing = 0
        cardFlowLayout.minimumLineSpacing = 12
        cardFlowLayout.scrollDirection = .horizontal
        
        cardCollectionView.collectionViewLayout = cardFlowLayout
        
        headerCollectionView.carouselDataSource = self
        
        let size = UIScreen.main.bounds.size
        headerCollectionView.flowLayout.itemSize = CGSize(width: size.width, height: size.width/375*270)

        scrollView.delegate = self
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        setInitLayout()
        setHeaderData()
        
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
    
    func setHeaderData() {
        
        headerImages.append(contentsOf: [
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader"),
            HeaderImages(headerImage: "imgHeader")
        ])
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

extension DetailVC: CarouselCollectionViewDataSource {
    var numberOfItems: Int {
        
        return 20
    }
    
    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, cellForItemAt index: Int, fakeIndexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderCell.identifier, for: fakeIndexPath) as? DetailHeaderCell else {
        
                return UICollectionViewCell()
        }
            cell.setCell(headerImage: headerImages[index])
                return cell
    }
    
    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, didSelectItemAt index: Int) {
        
        print("Did Select item at \(index)")
    }
    
    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, didDisplayItemAt index: Int) {
        
        self.currentPage.text = "\(index + 1)"
    }
}

extension DetailVC: UICollectionViewDelegate {
    
    
}
