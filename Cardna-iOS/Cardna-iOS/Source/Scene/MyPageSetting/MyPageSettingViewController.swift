//
//  MyPageSettingViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class MyPageSettingViewController: UIViewController {

    // MARK: - Property
    
    var sectionTitle: [String] = ["개인 정보","문의", "앱 정보"]
    var simpleCells: [String] = ["계정 설정","메일로 문의하기"]
    var cellTitle: [String] = ["버전 정보", "개발자 정보", "서비스 운영정책", "개인정보 이용약관", "서비스 이용약관", "오픈소스 라이선스"]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setTableViewUI()
        setLabelUI()
    }
    
    // MARK: - Function
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTableViewUI() {
        tableView.rowHeight = 48
        tableView.sectionHeaderHeight = 28
        tableView.sectionFooterHeight = 22
    }
    
    func setLabelUI() {
        titleLabel.font = .cardnaSh1Sbd
        titleLabel.textColor = .w1
    }
}
