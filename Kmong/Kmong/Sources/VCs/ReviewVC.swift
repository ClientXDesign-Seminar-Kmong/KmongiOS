//
//  ReviewVC.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/03.
//

import UIKit
import XLPagerTabStrip

class ReviewVC: UIViewController,IndicatorInfoProvider{
    
    var reviews : [Review] = []
    var starAvg : Float = 0.0
    var starSum : Int = 0

    @IBOutlet var reviewTableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerReviewCountLabel: UILabel!
    @IBOutlet var writeReviewButton: UIButton!
    @IBOutlet var star1ImageView: UIImageView!
    @IBOutlet var star2ImageView: UIImageView!
    @IBOutlet var star3ImageView: UIImageView!
    @IBOutlet var star4ImageView: UIImageView!
    @IBOutlet var star5ImageView: UIImageView!
    @IBOutlet var borderView: UIView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReviewData()
        reviewTableView.dataSource = self
        setAvgStar()
        

        headerReviewCountLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        headerReviewCountLabel.text = "리뷰 \(reviews.count)건"
        
        writeReviewButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        writeReviewButton.titleLabel?.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 0)
        
        reviewTableView.separatorInset.left = 20
        reviewTableView.separatorInset.right = 20
        DispatchQueue.main.async{
            self.tableViewHeight.constant = self.reviewTableView.contentSize.height
        }

        // Do any additional setup after loading the view.
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "리뷰")
    }

    func setReviewData() {
        reviews=[
            Review(id: "abc01234", date: "2020.11.11.", service: "심볼/엠블럼형 로고", review: "친절하게 해주셨어요. 감사합니다.", star: 4),
            Review(id: "eifddnf", date: "2020.12.03.", service: "iOS 앱 개발 외주", review: "빠르네요. 감사합니다.", star: 3),
            Review(id: "diafknd", date: "2020.12.01.", service: "와악", review: "얄머ㅏ아", star: 2),
            Review(id: "eifddnf", date: "2020.12.03.", service: "iOS 앱 개발 외주", review: "빠르네요. 감사합니다.", star: 5),
            Review(id: "ghcfhjking", date: "2020.12.01.", service: "와악", review: "과연 과연 과연 과연 글자가 글자가 글자가 많으면 많으면 어떻게 될까요?", star: 3)
        ]
    }
    
    func setAvgStar() {
        for i in 0...reviews.count-1 {
            starSum += reviews[i].star
        }
        starAvg = Float(starSum)/Float(reviews.count)
//        print(reviews.count, starSum, starAvg)
        
        if starAvg < 0.5 {
            star1ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        if starAvg >= 0.5 {
            star1ImageView.image = UIImage(named: "icStarReviewSelected")
        } else {
            star1ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        if starAvg >= 1.5 {
            star2ImageView.image = UIImage(named: "icStarReviewSelected")
        } else {
            star2ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        if starAvg >= 2.5 {
            star3ImageView.image = UIImage(named: "icStarReviewSelected")
        } else {
            star3ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        if starAvg >= 3.5 {
            star4ImageView.image = UIImage(named: "icStarReviewSelected")
        } else {
            star4ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        if starAvg >= 4.5 {
            star5ImageView.image = UIImage(named: "icStarReviewSelected")
        } else {
            star5ImageView.image = UIImage(named: "icStarReviewUnselected")
        }
        return
    }
    
    func addTopBorderWithColor(_ objView : UIView, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: objView.frame.size.width, height: width)
        objView.layer.addSublayer(border)
    }


}

extension ReviewVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTVC.identifier) as? ReviewTVC else {
            return UITableViewCell()
        }
        cell.setData(review: reviews[indexPath.item])
        
        return cell
    }
    
}


