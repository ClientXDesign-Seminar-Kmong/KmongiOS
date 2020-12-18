//
//  DetailExpertVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailExpertInfoVC: UIViewController, IndicatorInfoProvider {
    
    //MARK: - Custom Properties
    
    let expertInfoTitle = ["총 작업 개수","만족도","평균 응답 시간","회원 구분"]
    let expertInfoFixedValue = ["건","%","분 이내",""]
    var expertValue:[String] = []
    var expertData: DetailExpertData?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var expertImageView: UIImageView!
    @IBOutlet weak var expertName: UILabel!
    @IBOutlet weak var isExpertOn: UILabel!
    @IBOutlet weak var expertTableView: UITableView!
    
    //MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expertTableView.delegate = self
        expertTableView.dataSource = self
        setLayout()
        expertTableView.contentInset.top = 0
        callDetailExpert()
    }
    
    //MARK: - Custom Methods
    
    func setLayout(){
        expertImageView.layer.cornerRadius = expertImageView.frame.width/2
    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "전문가 정보")
    }
    func setContext(){
        expertName.text = expertData?.name
        isExpertOn.text = expertData?.connection
    }
    //MARK: - Network Methods
    
    func callDetailExpert(){
        DetailExpertService.shared.getDetailExpert(){ networkResult in
            switch networkResult{
            case .success(let data):
                if let expertData = data as? DetailExpertData{
                    print("expert 통신 성공")
                    self.expertData = expertData
                    self.expertValue = [String(self.expertData!.workCnt),String(self.expertData!.satisfaction),String(self.expertData!.responseTime),self.expertData!.membership]
                    self.setContext()
                    DispatchQueue.main.async{
                        self.expertTableView.reloadData()
                    }
                }
                else{
                    print("expert 통신 성공 - 모델 대응 오류")
                }
            case .requestErr(let message):
                
                print("requestErr",message)
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

//MARK: - UITableViewDelegate

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

//MARK: - UITableViewDataSource

extension DetailExpertInfoVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expertValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailExpertTVC") as? DetailExpertTVC else{ return UITableViewCell()}
        cell.setFixedLabel(text: expertInfoFixedValue[indexPath.row])
        cell.setInfoTitleLabel(text: expertInfoTitle[indexPath.row])
        cell.setValueLabel(text: expertValue[indexPath.row])
        return  cell
    }
    
    
}
