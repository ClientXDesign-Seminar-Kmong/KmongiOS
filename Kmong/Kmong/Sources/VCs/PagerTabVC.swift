//
//  PagerTabVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class PagerTabVC: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.selectedBarHeight = 1
        settings.style.selectedBarBackgroundColor = .black
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarMinimumInteritemSpacing = 0
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

      let child1 = UIStoryboard.init(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailDescVC") as! DetailDescVC
        
      let child2 = UIStoryboard.init(name: "DetailOption", bundle: nil).instantiateViewController(withIdentifier: "DetailOptionVC") as! DetailOptionVC
        
        let child3 = UIStoryboard.init(name: "DetailExpertInfo", bundle: nil).instantiateViewController(withIdentifier: "DetailExpertVC") as! DetailExpertVC
        
        let child4 = UIStoryboard.init(name: "DetailReview", bundle: nil).instantiateViewController(withIdentifier: "DetailReviewVC") as! DetailReviewVC

      return [child1, child2, child3, child4]

    }

}
