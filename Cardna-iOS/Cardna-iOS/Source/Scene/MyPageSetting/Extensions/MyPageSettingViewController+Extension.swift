//
//  MyPageSettingViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

extension MyPageSettingViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
}

extension MyPageSettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel()
        header.textColor = .w3
        header.text = sectionTitle[section]
        header.sizeToFit()
        header.font = .cardnaC
        let view = UIView()
        view.backgroundColor = UIColor(red: 18, green: 18, blue: 18, alpha: 0)
        view.addSubview(header)
        header.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.leading.equalToSuperview().inset(16)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return cellTitle.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageSettingTitleTableViewCell.identifier, for: indexPath) as? MyPageSettingTitleTableViewCell else { return UITableViewCell() }
        cell.functionLabel.textColor = .w1
        if indexPath.section == 2 {
            cell.functionLabel.text = cellTitle[indexPath.row]
            cell.functionLabel.sizeToFit()
            return cell
        }
        else {
            cell.functionLabel.text = simpleCells[indexPath.section]
            cell.functionLabel.sizeToFit()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 {
//            switch indexPath.row {
//            case 3..<5:
//                
//            default:
//                break
//            }
        }
    }
}
