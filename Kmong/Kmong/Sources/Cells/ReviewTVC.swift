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
    }

}

