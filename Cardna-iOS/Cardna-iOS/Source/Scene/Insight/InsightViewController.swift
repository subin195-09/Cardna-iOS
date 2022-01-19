//
//  InsightViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class InsightViewController: UIViewController {

    // MARK: - Property
    
    var deviceWidth: CGFloat = UIScreen.main.bounds.width
    var openCard: AreaCard?
    var blindCard: AreaCard?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var insightTitleLabel: UILabel!
    
    // MARK: Open Area Page outlet
    @IBOutlet weak var openAreaPageView: UIView!
    @IBOutlet weak var openAreaTitleLabel: UILabel!
    @IBOutlet weak var openAreaCardView: UIView!
    @IBOutlet weak var openAreaCardImageView: UIImageView!
    @IBOutlet weak var openAreaCardTitleLabel: UILabel!
    @IBOutlet weak var openAreaExplainLabel: UILabel!
    
    // MARK: Blind Area Page outlet
    @IBOutlet weak var blindAreaPageView: UIView!
    @IBOutlet weak var blindAreaCardView: UIView!
    @IBOutlet weak var blindAreaTitleLabel: UILabel!
    @IBOutlet weak var blindAreaCardImageView: UIImageView!
    @IBOutlet weak var blindAreaCardTitleLabel: UILabel!
    @IBOutlet weak var blindAreaExplainLabel: UILabel!
    @IBOutlet weak var openNilLabel: UILabel!
    @IBOutlet weak var blindNilLabel: UILabel!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitializeState()
        getInsightCard()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInitializeState()
        getInsightCard()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setLabelUI()
        setCardViewUI()
        setSize()
    }
    
    func setInitializeState() {
        [openAreaCardView, blindAreaCardView].forEach {
            $0?.isHidden = true
        }
        [openNilLabel, blindNilLabel].forEach {
            $0?.isHidden = true
        }
    }
    
    func setLabelUI() {
        setLabelFont()
        setLabelColor()
    }
    
    func setLabelFont() {
        insightTitleLabel.font = .cardnaH1Sbd
        [openAreaTitleLabel, blindAreaTitleLabel].forEach {
            $0?.font = .cardnaB2Sbd
        }
        [openAreaCardTitleLabel, blindAreaCardTitleLabel].forEach {
            $0?.font = .cardnaSh1Sbd
        }
        [openAreaExplainLabel, blindAreaExplainLabel].forEach {
            $0?.font = .cardnaSh3Sbd
            $0?.sizeToFit()
        }
        [openNilLabel, blindNilLabel].forEach {
            $0?.font = .Pretendard(.regular, size: 16)
            $0?.textColor = UIColor(white: 18.0 / 255.0, alpha: 0.4)
        }
    }
    
    func setLabelColor() {
        [insightTitleLabel, openAreaTitleLabel, blindAreaTitleLabel, openAreaCardTitleLabel, blindAreaCardTitleLabel, openAreaExplainLabel, blindAreaExplainLabel].forEach {
            $0?.textColor = UIColor(white: 18.0 / 255.0, alpha: 1.0)
        }
    }
    
    func setCardViewUI() {
        openAreaCardView.backgroundColor = .mainGreen
        blindAreaCardView.backgroundColor = .mainPurple
        [openAreaCardView, blindAreaCardView].forEach {
            $0?.layer.cornerRadius = 8.7
            $0?.layer.borderWidth = 1.7
            $0?.layer.borderColor = UIColor(white: 18.0 / 255.0, alpha: 1.0).cgColor
        }
        [openAreaCardImageView, blindAreaCardImageView].forEach {
            $0?.layer.borderWidth = 2
            $0?.layer.borderColor = UIColor(white: 18.0 / 255.0, alpha: 1.0).cgColor
        }
    }
    
    func setSize() {
        scrollView.snp.makeConstraints {
            $0.width.equalTo(deviceWidth*2)
        }
        pageView.snp.makeConstraints {
            $0.width.equalTo(deviceWidth*2)
        }
        backgroundImageView.snp.makeConstraints {
            $0.width.equalTo(deviceWidth*2)
        }
        openAreaPageView.snp.makeConstraints {
            $0.width.equalTo(deviceWidth)
        }
        blindAreaPageView.snp.makeConstraints {
            $0.width.equalTo(deviceWidth)
        }
    }
    
    func setInsightCardInfo() {
        if let open = openCard {
            if let imageString = open.imageURL {
                openAreaCardImageView.setImage(with: imageString)
                openAreaCardView.isHidden = false
                openAreaCardTitleLabel.text = open.title
                openNilLabel.isHidden = true
            }
            else {
                openAreaCardView.isHidden = true
                openNilLabel.isHidden = false
            }
        }
        else {
            openAreaCardView.isHidden = true
            openNilLabel.isHidden = false
        }
        
        if let blind = blindCard {
            if let imageString = blind.imageURL {
                blindAreaCardImageView.setImage(with: imageString)
                blindAreaCardView.isHidden = false
                blindAreaCardTitleLabel.text = blind.title
                blindNilLabel.isHidden = true
            }
            else {
                blindAreaCardView.isHidden = true
                blindNilLabel.isHidden = false
            }
        }
        else {
            blindAreaCardView.isHidden = true
            blindNilLabel.isHidden = false
        }
    }
}
