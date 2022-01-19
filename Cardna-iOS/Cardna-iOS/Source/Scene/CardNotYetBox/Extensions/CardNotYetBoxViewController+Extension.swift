//
//  CardNotYetBoxViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

extension CardNotYetBoxViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailVC = UIStoryboard(name: "CardDetail", bundle: nil).instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else { return }
        detailVC.cardDetailWhere = 2
        detailVC.cardID = cardNotYetList[indexPath.row].id
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension CardNotYetBoxViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardNotYetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.setData(title: cardNotYetList[indexPath.row].title, from: cardNotYetList[indexPath.row].name, hasImage: cardNotYetList[indexPath.row].isImage, date: cardNotYetList[indexPath.row].createdAt)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
