//
//  DetailExpertVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailExpertInfoVC: UIViewController, IndicatorInfoProvider {
    
    let expertInfoTitle = ["총 작업 개수","만족도","평균 응답 시간","회원 구분"]
    let expertInfoFixedValue = ["건","%","분 이내","개인"]
    let expertValue = ["515","99","30",""]

    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var expertImageView: UIImageView!
    @IBOutlet weak var expertName: UILabel!
    @IBOutlet weak var isExpertOn: UILabel!
    @IBOutlet weak var expertTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        expertTableView.delegate = self
        expertTableView.dataSource = self
        setLayout()
        expertTableView.contentInset.top = 0
//        DispatchQueue.main.async {
//            self.tableHeight.constant = self.expertTableView.contentSize.height
//        }
        
    }
    func setLayout(){
        expertImageView.layer.cornerRadius = expertImageView.frame.width/2
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "전문가 정보")
    }
}
extension DetailExpertInfoVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
}
extension DetailExpertInfoVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expertInfoFixedValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailExpertTVC") as? DetailExpertTVC else{ return UITableViewCell()}
        cell.setFixedLabel(text: expertInfoFixedValue[indexPath.row])
        cell.setInfoTitleLabel(text: expertInfoTitle[indexPath.row])
        cell.setValueLabel(text: expertValue[indexPath.row])
        return  cell
    }
    
    
}
