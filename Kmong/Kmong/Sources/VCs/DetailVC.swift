//
//  DetailVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/15.
//

import UIKit
import XLPagerTabStrip
import InfiniteCarouselCollectionView

// CardCollectionView DataSource
class DetailVC: UIViewController, UICollectionViewDataSource,HeightDelegate {
    func setHeight(_ height: CGFloat) {
        self.height.constant = height
        self.view.layoutIfNeeded()
    }
    
    @IBOutlet weak var height: NSLayoutConstraint!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)

        cell.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1).cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 5
        
        return cell
    }
    
    @IBOutlet weak var headerCollectionView: CarouselCollectionView!
    @IBOutlet weak var pageNumberView: UIView!
    @IBOutlet weak var inquiryView: UIButton!
    @IBOutlet weak var purchaseView: UIButton!
    @IBOutlet weak var currentPage: UILabel!
    @IBOutlet weak var heartView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var heartLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var layerLabel: UILabel!
    @IBOutlet weak var imageNumber: UILabel!
    
    var headerImages: [ServiceImg] = []
    var upperData: ServiceUpperData?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "segue" {
                let viewController : PagerTabVC = segue.destination as! PagerTabVC
                    viewController.heightDelegate = self
            }
        }
    
    func setUpper() {
        
        titleLabel.text = upperData?.title
        reviewLabel.text = String(upperData!.review)
        priceLabel.text = String(upperData!.price)
        layerLabel.text = upperData?.layer
        headerImages = upperData!.serviceImgs
        imageNumber.text = String(headerImages.count)
        heartLabel.text = String(upperData!.heart)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailServiceUpper.shared.ServiceUpper() { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let serviceUpperData = data as? ServiceUpperData {
                    self.upperData = serviceUpperData
                    self.setUpper()
                    
                    DispatchQueue.main.async {
                        
                        self.headerCollectionView.reloadData()
                    }
                    
                    print(serviceUpperData)
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
        
        //cardCollectionView 레이아웃 구성
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
//        setHeaderData()
        
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

    // 문의, 구매, 하트 버튼 레이아웃 구성
    func setInitLayout() {
        
        pageNumberView.layer.cornerRadius = 9
        
        inquiryView.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1).cgColor
        inquiryView.layer.borderWidth = 1
        inquiryView.layer.cornerRadius = 6
        
        purchaseView.layer.cornerRadius = 6
        
        heartView.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1).cgColor
        heartView.layer.borderWidth = 1
        heartView.layer.cornerRadius = 6
    }
    
    // Like Button설정
    var bRec:Bool = false
    
    @IBAction func heartBtn(_ sender: Any) {
       
        bRec = !bRec
        
        if bRec {
            
            heartView.setImage(UIImage(named: "icLikeSelected"), for: .normal)
            heartView.layer.borderColor = UIColor.yellow.cgColor
            heartView.layer.borderColor = UIColor(red: 249/255, green: 212/255, blue: 72/255, alpha: 1).cgColor
        } else {
            
            heartView.setImage(UIImage(named: "icLikeUnselected"), for: .normal)
            heartView.layer.borderColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1).cgColor
        }
    }
    @IBAction func touchUpBack(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
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

// Carousel Banner Cell, 페이지 텍스트 설정
extension DetailVC: CarouselCollectionViewDataSource {
    var numberOfItems: Int {
        
        return headerImages.count
    }
    
    func carouselCollectionView(_ carouselCollectionView: CarouselCollectionView, cellForItemAt index: Int, fakeIndexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = carouselCollectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderCell.identifier, for: fakeIndexPath) as? DetailHeaderCell else {
        
                return UICollectionViewCell()
        }
//            cell.setCell(headerImage: headerImages[index])
        cell.setCell(url: headerImages[index].img)
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
