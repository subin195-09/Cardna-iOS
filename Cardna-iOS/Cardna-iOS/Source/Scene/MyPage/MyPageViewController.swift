//
//  MyPageViewController.swift
//  Cardna-iOS
//
//  Created by κΉνμ on 2022/01/09.
//

import UIKit

class MyPageViewController: UIViewController {
    
    // MARK: - Property
    var myInfo: MyPageResponse?
    var friendList: [FriendList] = []
    var filteredList: [FriendList] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var friendTitleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var friendCountLabel: UILabel!
    
    // MARK: - VC LifeCycle
    override func viewWillAppear(_ animated: Bool) {
        getMyPageInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        tableView.separatorColor = .clear
        if #available(iOS 15, *) {
            tableView.sectionFooterHeight = 0
            tableView.sectionHeaderHeight = 0
        }
    }
    
    func setSearchBarDelegate() {
        searchBar.delegate = self
        filteredList = friendList
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
            ///μμΉλ° λ°±κ·ΈλΌμ΄λ μ»¬λ¬
            textfield.backgroundColor = .w4
            ///μμΉλ° νμ€νΈμλ ₯μ μ μ νκΈ°
            textfield.textColor = UIColor.w1
            textfield.placeholder = "μ΄λ¦ κ²μ"
            ///νλ μ΄μ€νλ κΈμ¨ μ μ νκΈ°
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.w2])
            textfield.font = .Pretendard(.regular, size: 16)
            ///μΌμͺ½ μμ΄μ½ μ΄λ―Έμ§λ£κΈ°
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
                self.filteredList = self.friendList
                self.setSearchBarDelegate()
                self.setTableView()
                self.tableView.reloadData()
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
