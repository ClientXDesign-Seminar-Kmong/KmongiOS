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
    
    @IBOutlet weak var textLabel: UILabel!
    
    var descData: DetailDescriptionData?
    
    func setDesc() {
        
        textLabel.text = descData?.dataDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailDescription.shared.detailDescription() { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let detailDescData = data as? DetailDescriptionData {
                    self.descData = detailDescData
                    self.setDesc()
                    
                    print(detailDescData)
                }
            case .requestErr(let msg):
                if let message = msg as? String {
                    print(message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
