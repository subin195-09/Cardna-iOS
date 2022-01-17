//
//  EmailSearchViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation
import UIKit

extension EmailSearchViewController {
    func getSearchByEmail() {
        guard let email = searchTextField.text else { return }
        
        EmailSearchService.shared.getFriendbyEmailSearch(email: email) { response in
            switch response {
            case .success(let data):
                print(data)
                guard let res = data as? EmailSearchResponse else { return }
                self.friendExist = true
                self.nowFriend = res.isFriend
                self.setFriendResult(data: res)
                self.hideResult()
            case .requestErr(_):
                self.friendExist = false
                print("RequestErr")
            case .pathErr:
                self.friendExist = false
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func postAddDeleteFriend() {
        AddFriendService.shared.postAddFriend(parameter: AddFriendRequest.init(friendID: friendID)) { response in
            switch response {
            case .success(let data):
                print(data)
                guard let res = data as? AddFriendResponse else { return }
                self.nowFriend = res.isFriend
            case .requestErr(_):
                print("RequestErr")
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

extension EmailSearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        noResultLabel.isHidden = false
        if textField == searchTextField {
            self.getSearchByEmail()
        }
        return true
    }
}
