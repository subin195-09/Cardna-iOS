//
//  CardNotYetBoxViewController.swift
//  Cardna-iOS
//
//  Created by κΉνμ on 2022/01/15.
//

import UIKit

class CardNotYetBoxViewController: UIViewController {
    
    // MARK: - Property
    var cardNotYetList: [CardNotYet] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VC LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        getCardNotYetBoxList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
        registerXib()
    }
    
    // MARK: - Function
    
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
    
    func getCardNotYetBoxList() {
        CardPackService.shared.getCardNotYetBox { response in
            switch response {
            case .success(let data):
                guard let data = data as? [CardNotYet] else { return }
                self.cardNotYetList = data
                self.tableView.reloadData()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathERr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFAil")
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
