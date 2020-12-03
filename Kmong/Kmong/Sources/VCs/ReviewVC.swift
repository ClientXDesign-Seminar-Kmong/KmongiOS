//
//  ReviewVC.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/03.
//

import UIKit

class ReviewVC: UIViewController {
    
    var reviews : [Review] = []

    @IBOutlet var reviewTableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerReviewCountLabel: UILabel!
    @IBOutlet var writeReviewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setReviewData()
        reviewTableView.dataSource = self

        headerReviewCountLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
        
        writeReviewButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 14)
        writeReviewButton.titleLabel?.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 0)
        
        // Do any additional setup after loading the view.
    }
    
    func setReviewData() {
        reviews.append(contentsOf: [
            Review(id: "eifddnf", date: "2020.12.03.", service: "iOS 앱 개발 외주", review: "빠르네요. 감사합니다.", star: 3),
            Review(id: "diafknd", date: "2020.12.01.", service: "와악", review: "얄머ㅏ아", star: 2),
            Review(id: "eifddnf", date: "2020.12.03.", service: "iOS 앱 개발 외주", review: "빠르네요. 감사합니다.", star: 5),
            Review(id: "diafknd", date: "2020.12.01.", service: "와악", review: "얄머ㅏ아", star: 3),
            Review(id: "abc01234", date: "2020.11.11.", service: "심볼/엠블럼형 로고", review: "친절하게 해주셨어요. 감사합니다.", star: 4)
        ])
    }


}

extension ReviewVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTVC.identifier) as? ReviewTVC else {
            return UITableViewCell()
        }
        cell.setData(review: reviews[indexPath.item])
        
        return cell
    }
    
    
}

