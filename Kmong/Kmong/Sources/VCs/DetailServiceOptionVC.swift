//
//  DetailOptionVC.swift
//  Kmong
//
//  Created by 곽기곤's Mac on 2020/11/17.
//

import UIKit
import XLPagerTabStrip

class DetailServiceOptionVC: UIViewController, IndicatorInfoProvider {
    // MARK: - IBOutlets
    @IBOutlet weak var newSignUpButton: UIButton!
    @IBOutlet weak var detailOptionTableView: UITableView!
    
    // MARK: - Custom Properties
    let deselectedCheckImage = UIImage(named:"icOptionUnselected")
    let selectedCheckImage = UIImage(named:"icOptionSelected")
    let optionTitleList = ["텍스트형 로고","심볼/엠블럼형 로고","프리미엄 로고"]
    
    var detailOptionList: [DetailOptionData] = []
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        detailOptionTableView.delegate = self
        detailOptionTableView.dataSource = self
        detailOptionTableView.contentInset.bottom = 0
//        DispatchQueue.main.async {
//            self.detailOptionTableView.selectRow(at: IndexPath(row:0, section:0), animated: false, scrollPosition: .none)
//        }
        callDetailOption()
        setLayout()
        setContext()
    }
    
    // MARK: - Custom Methods
    func setLayout(){
        newSignUpButton.layer.borderWidth = 1
        newSignUpButton.layer.cornerRadius = 6
        newSignUpButton.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1).cgColor
        newSignUpButton.setTitleColor(.brownishGrey, for: .normal)
    }
    func callDetailOption(){
        DetailServiceOptionService.shared.getDetailServiceOption(){ networkResult in
            switch networkResult{
            case .success(let data):
                print("Detail Option : 200")
                if let list = data as? [DetailOptionData]{
                    self.detailOptionList = list
                    print("Detail Option : 네트워크 성공")
                    DispatchQueue.main.async{
                        self.detailOptionTableView.reloadData()
                    }
                }
                    else { print("데이터 - 모델 대응 오류")}
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
    func setContext(){
        //label의 텍스트에 부분적인 효과를 주기 위해서 NSAttributedString 이용
        let text = "신규 가입을 하면 10,000원 할인쿠폰 을 드려요!"
        let keyText = "10,000원"
        let fontSize = UIFont.boldSystemFont(ofSize: 12)
        let attributedStr = NSMutableAttributedString(string: text)
        //kCTFontAttributeName을 통해 value로 폰트 크기와 폰트를 받는다.
        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: fontSize, range: ( text as NSString).range(of: keyText))
        attributedStr.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: (text as NSString).range(of:keyText ))
        newSignUpButton.setAttributedTitle(attributedStr, for: .normal)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "서비스 옵션")
    }
    func setSelectedCell(_ cell: DetailOptionTVC){
        cell.borderView.layer.borderColor = UIColor.sunYellow.cgColor
        cell.selectedOptionView.isHidden = false
        cell.selectedOptionViewHeightConstraint.constant = 202
        cell.optionCheckBox.image = selectedCheckImage
        
    }
    func setDeselectedCell(_ cell: DetailOptionTVC){
        
        cell.borderView.layer.borderColor = UIColor.veryLightPink.cgColor
        cell.selectedOptionView.isHidden = true
        cell.selectedOptionViewHeightConstraint.constant = 0
        cell.optionCheckBox.image = deselectedCheckImage
        
        
    }
}
// MARK: - UITableViewDelegate
extension DetailServiceOptionVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected",indexPath)
        if let cell = tableView.cellForRow(at: indexPath) as? DetailOptionTVC{
            //레이아웃 업데이트되는 애니메이션 없이
            UIView.performWithoutAnimation {
                //바뀐 레이아웃 값으로 테이블뷰 업데이트
                tableView.performBatchUpdates({setSelectedCell(cell)}, completion: nil)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselected",indexPath)
        if let cell = tableView.cellForRow(at: indexPath) as? DetailOptionTVC{
            UIView.performWithoutAnimation {
                tableView.performBatchUpdates({setDeselectedCell(cell)}, completion: nil)
            }
        }
        
        
    }
    
}
// MARK: - UITableViewDataSource
extension DetailServiceOptionVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailOptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailOptionTVC") as? DetailOptionTVC else{
            return UITableViewCell()
        }
        //기본으로 적용되는 selectionStyle 제거
        cell.selectionStyle = .none
        //초기에 첫번재 옵션이 선택되어 있도록 함
        if indexPath.row == 0{
            cell.isSelected = true
            setSelectedCell(cell)
        }
        cell.optionTitleLabel.text = self.detailOptionList[indexPath.row].title
        return cell
    }
    
    
}
