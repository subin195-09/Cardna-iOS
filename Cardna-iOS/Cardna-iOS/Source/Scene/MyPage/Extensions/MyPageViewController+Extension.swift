//
//  MyPageViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

extension MyPageViewController: UITableViewDelegate {
    
}

extension MyPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 122
        }
        else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 { return headerView }
        else { return nil }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageProfileTableViewCell.identifier, for: indexPath) as? MyPageProfileTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageFriendsTableViewCell.identifier, for: indexPath) as? MyPageFriendsTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 80
        case 1: return 10/2 * 200
        default: return 0
        }
    }
}
