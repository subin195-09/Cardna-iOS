//
//  MyPageViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class MyPageViewController: UIViewController {
    
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
        setUI()
        setTableView()
    }
    
    // MARK: - Function
    
    func setUI() {
        setNavigationBarUI()
        setTableViewHeaderUI()
        setSearchBarUI()
    }
    
    func setNavigationBarUI() {
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
}
