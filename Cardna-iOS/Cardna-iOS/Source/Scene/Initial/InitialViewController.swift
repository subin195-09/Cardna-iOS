//
//  InitialViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class InitialViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setLabelUI()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func setLabelUI() {
        titleLabel.font = .cardnaB3Rg
        titleLabel.textColor = .w2
    }
    // MARK: - IBAction
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }

        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func joinButtonDidTap(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "JoinViewController", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "JoinViewController") as? JoinViewController else { return }

        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
