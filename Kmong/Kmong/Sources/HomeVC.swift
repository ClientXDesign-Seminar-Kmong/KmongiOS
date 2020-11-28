//
//  HomeVC.swift
//  Kmong
//
//  Created by DANNA LEE on 2020/11/20.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.dataSource = self
    }

}

extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeRecServiceTableViewCell.identifier) as? HomeRecServiceTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}


//extension UILabel {
//    func textFieldTextonBaseLine(text: String?, lineHeight: CGFloat) {
//        let attributes: [NSAttributedString.Key: Any] = [
//        .baselineOffset: (lineHeight - font.lineHeight)
//        ]
//    }
//}
//
