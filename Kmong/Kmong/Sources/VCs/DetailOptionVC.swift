//
//  DetailOptionVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailOptionVC: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "서비스 옵션")
    }
}
