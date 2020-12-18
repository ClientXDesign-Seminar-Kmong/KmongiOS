//
//  serviceOptionTVC.swift
//  Kmong
//
//  Created by 이예슬 on 2020/11/20.
//

import UIKit

class DetailOptionTVC: UITableViewCell {
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var selectedOptionView: UIView!
    @IBOutlet weak var selectedOptionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var optionCheckBox: UIImageView!
    @IBOutlet weak var optionTitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet var subContentLabel: [UILabel]!
    @IBOutlet weak var additionalInfoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderView.layer.borderColor = UIColor.veryLightPink.cgColor
        self.borderView.layer.borderWidth = 1
        self.borderView.layer.cornerRadius = 6
        self.selectedOptionView.isHidden = true
        self.selectedOptionViewHeightConstraint.constant = 0
        
    }
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + " 원"
            
            return result
        }
    func setContext(_ data: DetailOptionData){
        optionTitleLabel.text = data.title
        contentLabel.text = data.content
        var i = 0
        for subContent in subContentLabel{
            subContent.text = data.subContent[i]
            i += 1
        }
        additionalInfoLabel.text = "작업일: \(data.deadline)일  수정 횟수: \(data.edit)회"
        
        priceLabel.text = decimalWon(value: data.price)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
