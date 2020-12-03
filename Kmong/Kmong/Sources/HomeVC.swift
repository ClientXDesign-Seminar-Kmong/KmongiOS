//
//  HomeVC.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/20.
//

import UIKit
import InfiniteLayout

class HomeVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet var homeHeaderCollectionView: InfiniteCollectionView!
    
    var expertType : [ExpertType] = []
    var timer = Timer()
    var counter = 0
    let imgArr = [UIImage(named: "homeCard2"), UIImage(named: "homeCard2")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeHeaderCollectionView.delegate = self
        homeHeaderCollectionView.dataSource = self
        setCell()
        homeTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        homeHeaderCollectionView.isItemPagingEnabled = true
        homeHeaderCollectionView.velocityMultiplier = 1
        homeHeaderCollectionView.preferredCenteredIndexPath = [0,0]
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.changeIMG), userInfo: nil, repeats: true)
        }
    }
    
    @objc func changeIMG(){
        
        let index = IndexPath.init(item: counter, section: 0) //인덱스 패스 생성.
        self.homeHeaderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true) // 해당 인덱스로 이동.
        counter += 1 // 인덱스 증가
    }
    
    func setCell() {
//        serviceType.text = type.type
        expertType.append(contentsOf: [
            ExpertType(type: "디자인"),
            ExpertType(type: "프로그래밍")
        ])
    }
    
    func simpleAlert() {
        let alert = UIAlertController(title: "아잇", message: "누르지 마세요.\n아무 일도 안 일어나요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "사과하기", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func TouchUpAlert(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpSearch(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpDesign(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpTranslate(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpConsult(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpIT(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpWriting(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpLesson(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpVideo(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpBusiness(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpDIY(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpMarketing(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpCareer(_ sender: Any) {
        self.simpleAlert()
    }
    @IBAction func TouchUpEbook(_ sender: Any) {
        self.simpleAlert()
    }

}
// MARK : - UITableViewDataSource
extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expertType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeRecServiceTableViewCell.identifier) as? HomeRecServiceTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.setDesignerData()
        }
        else {
            cell.setProgrammerData()
        }
        cell.setCell(type: expertType[indexPath.item])
        cell.naviHere = self.navigationController
        return cell
    }
}

extension HomeVC: UITableViewDelegate{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset.y)
////
////    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeRecommendedServiceCVC.identifier, for: indexPath) as? HomeRecommendedServiceCVC else {
//        }
//        let cell.naviHere = self.navigationController
//    }
}
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCVC.identifier, for: indexPath) as? HomeHeaderCVC else {
            return UICollectionViewCell()
        }
        cell.setImage(imageName: "homeCard2")
        
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-40, height: collectionView.frame.height)
    }

//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.scrollToItem(at: indexPath, at: self.homeHeaderCollectionView!.infiniteLayout.scrollDirection == .vertical ? .centeredVertically : .centeredHorizontally, animated: true)
        }
}
