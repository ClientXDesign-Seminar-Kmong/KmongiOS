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
    override func awakeFromNib() {
        super.awakeFromNib()
        self.borderView.layer.borderColor = UIColor.veryLightPink.cgColor
        self.borderView.layer.borderWidth = 1
        self.borderView.layer.cornerRadius = 6
        self.selectedOptionView.isHidden = true
        self.selectedOptionViewHeightConstraint.constant = 0
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
