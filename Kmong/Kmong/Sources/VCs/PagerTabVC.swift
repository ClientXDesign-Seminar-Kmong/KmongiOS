//
//  PagerTabVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

public protocol PagerTabStripDelegate: class {

    func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int)
}

public protocol PagerTabStripIsProgressiveDelegate : PagerTabStripDelegate {

    func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool)
}

class PagerTabVC: ButtonBarPagerTabStripViewController {
    
    

    override func viewDidLoad() {
        
        loadDesign()
        
        
        super.viewDidLoad()
        
        
    }
    
    
    
    func loadDesign() {
        
        settings.style.selectedBarHeight = 2
        settings.style.selectedBarBackgroundColor = UIColor.black
        settings.style.buttonBarBackgroundColor = UIColor.white
        settings.style.buttonBarItemBackgroundColor = UIColor.white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarMinimumInteritemSpacing = 0
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            oldCell?.label.textColor = .systemGray5
            newCell?.label.textColor = .black
        }
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

      let child1 = UIStoryboard.init(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailDescVC") as! DetailDescVC
        
      let child2 = UIStoryboard.init(name: "DetailServiceOption", bundle: nil).instantiateViewController(withIdentifier: "DetailServiceOptionVC") as! DetailServiceOptionVC
        
        let child3 = UIStoryboard.init(name: "DetailExpertInfo", bundle: nil).instantiateViewController(withIdentifier: "DetailExpertVC") as! DetailExpertInfoVC
        
        let child4 = UIStoryboard.init(name: "DetailReview", bundle: nil).instantiateViewController(withIdentifier: "DetailReviewVC") as! DetailReviewVC

      return [child1, child2, child3, child4]

    }
    
    

}
