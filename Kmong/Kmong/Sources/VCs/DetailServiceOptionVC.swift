//
//  DetailOptionVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailServiceOptionVC: UIViewController, IndicatorInfoProvider {

    @IBOutlet weak var newSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    setLayout(){
//        newSignUpButton.layer.borderWidth = 1
//        newSignUpButton.layer.cornerRadius = 6
//        newSignUpButton.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
//    }
//    setContext(){
//        
//    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "서비스 옵션")
    }
}
