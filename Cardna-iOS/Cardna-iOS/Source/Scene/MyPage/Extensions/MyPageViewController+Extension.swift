//
//  MyPageViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

extension MyPageViewController: MyPageFriendSelectProtocol {
    func pushFriendMainCard(friendID: Int, friendName: String) {
        guard let friendMainCardVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else { return }
        friendMainCardVC.friendID = friendID
        friendMainCardVC.name = friendName
        friendMainCardVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(friendMainCardVC, animated: true)
    }
}

extension MyPageViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredList = []
        
        /// 검색창에 글자가 없을 때
        if searchText == "" {
            filteredList = friendList
        }
        /// 검색창에 글자가 있을 때 (검색했을 때)
        else {
            for friend in friendList {
                if friend.name.lowercased().contains(searchText.lowercased()) {
                    filteredList.append(friend)
                }
            }
        }
        self.tableView.reloadData()
    }
}

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
            cell.setData(image: myInfo?.userImg ?? "", name: myInfo?.name ?? "", email: myInfo?.email ?? "")
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyPageFriendsTableViewCell.identifier, for: indexPath) as? MyPageFriendsTableViewCell else { return UITableViewCell() }
            cell.setData(friendList: filteredList)
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 80
        case 1: return (UIScreen.main.bounds.width * (186/375) + 12) * round(CGFloat(friendList.count/2)) - 12
        default: return 0
        }
    }
}
