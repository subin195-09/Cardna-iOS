//
//  MyPageViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class MyPageViewController: UIViewController {
    
    // MARK: - Property
    var myInfo: MyPageResponse?
    var friendList: [FriendList] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var friendTitleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var friendCountLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMyPageInfo()
        setUI()
        
    }
    
    // MARK: - Function
    
    func setUI() {
        setNavigationBarUI()
        setTableViewHeaderUI()
        setSearchBarUI()
    }
    
    func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
        navigationTitleLabel.font = .cardnaH1Sbd
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        if #available(iOS 15, *) {
            tableView.sectionFooterHeight = 0
            tableView.sectionHeaderHeight = 0
        }
    }
    
    func setTableViewHeaderUI() {
        friendTitleLabel.textColor = .w1
        friendTitleLabel.font = .cardnaSh1Sbd
        friendCountLabel.font = .Pretendard(.regular, size: 16)
        friendCountLabel.textColor = .w3
    }
    
    func setSearchBarUI(){
        searchBar.backgroundColor = .clear
        searchBar.setImage(Const.Image.icbtSearch, for: .search, state: .normal)
        searchBar.searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchTextField.heightAnchor.constraint(equalTo: searchBar.heightAnchor).isActive = true
        searchBar.searchTextField.widthAnchor.constraint(equalTo: searchBar.widthAnchor).isActive = true
        
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: UIBarMetrics.default)
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            ///서치바 백그라운드 컬러
            textfield.backgroundColor = .w4
            ///서치바 텍스트입력시 색 정하기
            textfield.textColor = UIColor.w1
            textfield.placeholder = "이름 검색"
            ///플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.w2])
            textfield.font = .Pretendard(.regular, size: 16)
            ///왼쪽 아이콘 이미지넣기
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = Const.Image.icbtSearch
            }
        }
    }
    
    func getMyPageInfo() {
        MyPageService.shared.getMyPage { response in
            switch response {
            case .success(let data):
                print(data)
                guard let data = data as? MyPageResponse else { return }
                self.friendCountLabel.text = "\(data.friendList.count)"
                self.myInfo = data
                self.friendList = data.friendList
                self.setTableView()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func cardNotYetBoxButtonDidTap(_ sender: Any) {
        guard let cardNotYetBoxVC = UIStoryboard(name: "CardNotYetBox", bundle: nil).instantiateViewController(withIdentifier: "CardNotYetBoxViewController") as? CardNotYetBoxViewController else { return }
        cardNotYetBoxVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cardNotYetBoxVC, animated: true)
    }
    
    @IBAction func settingButtonDidTap(_ sender: Any) {
        guard let settingVC = UIStoryboard(name: "MyPageSetting", bundle: nil).instantiateViewController(withIdentifier: "MyPageSettingViewController") as? MyPageSettingViewController else { return }
        settingVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    @IBAction func emailSearchButtonDidTap(_ sender: Any) {
        guard let emailSerchVC = UIStoryboard(name: "EmailSearch", bundle: nil).instantiateViewController(withIdentifier: "EmailSearchViewController") as? EmailSearchViewController else { return }
        emailSerchVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(emailSerchVC, animated: true)
    }
}
