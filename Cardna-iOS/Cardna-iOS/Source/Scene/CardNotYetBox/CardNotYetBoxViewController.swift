//
//  CardNotYetBoxViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

class CardNotYetBoxViewController: UIViewController {
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
        registerXib()
    }
    
    func setUI() {
        navigationTitleLabel.font = .cardnaSh1Sbd
        navigationTitleLabel.textColor = .w1
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
    func registerXib() {
        let nib = UINib(nibName: ListTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ListTableViewCell.identifier)
    }
}
