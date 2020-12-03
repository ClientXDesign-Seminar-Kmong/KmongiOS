//
//  PagerTabVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip
//public protocol HeightDelegate: class{
//    func setHeight(_ height: CGFloat)
//}
public protocol PagerTabStripDelegate: class {

    func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int)
}

public protocol PagerTabStripIsProgressiveDelegate : PagerTabStripDelegate {

    func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool)
}

class PagerTabVC: ButtonBarPagerTabStripViewController {
    
//    var heightDelegate: HeightDelegate?

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
        settings.style.buttonBarMinimumLineSpacing = 0
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

      let child1 = UIStoryboard.init(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "DetailDescVC") as! DetailDescVC
        
      let child2 = UIStoryboard.init(name: "DetailServiceOption", bundle: nil).instantiateViewController(withIdentifier: "DetailServiceOptionVC") as! DetailServiceOptionVC
        
        let child3 = UIStoryboard.init(name: "DetailExpertInfo", bundle: nil).instantiateViewController(withIdentifier: "DetailExpertVC") as! DetailExpertInfoVC
        
        let child4 = UIStoryboard.init(name: "Review", bundle: nil).instantiateViewController(withIdentifier: "ReviewVC") as! ReviewVC

      return [child1, child2, child3, child4]

    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            print(scrollView.contentOffset)
            let x = scrollView.contentOffset.x
            print("xx",x)
            let width = containerView.frame.width
            if 0.0<=x && x<width/2{
                self.heightDelegate?.setHeight(590.0)
            }
            else if x == width{
                self.heightDelegate?.setHeight(569.0)
            }
            else if x == width*2{
                self.heightDelegate?.setHeight(360.0)
            }
            else if x == width*3{
                self.heightDelegate?.setHeight(725.0)    }
        }
    
    

}
