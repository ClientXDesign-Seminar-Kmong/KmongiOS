//
//  ReviewTVC.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/12/03.
//

import UIKit

class ReviewTVC: UITableViewCell {
    
    static let identifier = "ReviewTVC"

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var serviceLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var star1ImageView: UIImageView!
    @IBOutlet var star2ImageView: UIImageView!
    @IBOutlet var star3ImageView: UIImageView!
    @IBOutlet var star4ImageView: UIImageView!
    @IBOutlet var star5ImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(review : Review) {
        idLabel.text = review.hideID(id: review.id)
        dateLabel.text = review.date
        serviceLabel.text = review.service
        reviewLabel.text = review.review
        setStar(review: review)
    }
    
    func setStar(review : Review) {
        if review.star == 0 {
            star1ImageView.image = UIImage(named: "icStarUnselected")
        }
        if review.star >= 1 {
            star1ImageView.image = UIImage(named: "icStarSelected")
        } else {
            star1ImageView.image = UIImage(named: "icStarUnselected")
        }
        if review.star >= 2 {
            star2ImageView.image = UIImage(named: "icStarSelected")
        } else {
            star2ImageView.image = UIImage(named: "icStarUnselected")
        }
        if review.star >= 3 {
            star3ImageView.image = UIImage(named: "icStarSelected")
        } else {
            star3ImageView.image = UIImage(named: "icStarUnselected")
        }
        if review.star >= 4 {
            star4ImageView.image = UIImage(named: "icStarSelected")
        } else {
            star4ImageView.image = UIImage(named: "icStarUnselected")
        }
        if review.star == 5 {
            star5ImageView.image = UIImage(named: "icStarSelected")
        } else {
            star5ImageView.image = UIImage(named: "icStarUnselected")
        }
        return
    }

}

