//
//  DetailOptionVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailDescVC: UIViewController, IndicatorInfoProvider {
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "서비스 설명")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
