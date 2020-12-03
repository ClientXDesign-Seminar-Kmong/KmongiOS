//
//  DetailExpertTVC.swift
//  Kmong
//
//  Created by 이예슬 on 2020/12/03.
//

import UIKit

class DetailExpertTVC: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var fixedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setFixedLabel(text: String){
        fixedLabel.text = text
    }
    func setInfoTitleLabel(text: String){
        infoTitleLabel.text = text
    }
    func setValueLabel(text: String){
        valueLabel.text = text
    }

}
