//
//  HomeViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function

    func setUI() {
        setNavigationBarUI()
        setTitleUI()
    }
    
    func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setTitleUI() {
        nameLabel.font = .Pretendard(.light, size: 28)
        commentLabel.font = .cardnaH1Sbd
    }
}
