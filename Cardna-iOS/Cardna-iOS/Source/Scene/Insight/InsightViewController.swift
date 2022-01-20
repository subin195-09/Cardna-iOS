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
    var deviceHeight: CGFloat = UIScreen.main.bounds.height
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
    @IBOutlet weak var openAreaUnderBarView: UIView!
    
    // MARK: Blind Area Page outlet
    @IBOutlet weak var blindAreaPageView: UIView!
    @IBOutlet weak var blindAreaCardView: UIView!
    @IBOutlet weak var blindAreaTitleLabel: UILabel!
    @IBOutlet weak var blindAreaCardImageView: UIImageView!
    @IBOutlet weak var blindAreaCardTitleLabel: UILabel!
    @IBOutlet weak var blindAreaExplainLabel: UILabel!
    @IBOutlet weak var blindAreaUnderBarView: UIView!
    @IBOutlet weak var openNilLabel: UILabel!
    @IBOutlet weak var blindNilLabel: UILabel!
    
    // MARK: Layout For device
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var cardViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var explainLabelTopConstraint: NSLayoutConstraint!
    
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitializeState()
        getInsightCard()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setInitializeState()
        setPosition()
        getInsightCard()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setLabelUI()
        setCardViewUI()
        setSize()
        setAutoLayoutForDevice()
    }
    
    func setInitializeState() {
        [openAreaCardView, blindAreaCardView].forEach {
            $0?.isHidden = true
        }
        [openNilLabel, blindNilLabel].forEach {
            $0?.isHidden = true
        }
    }
    
    func setPosition() {
        scrollView.setContentOffset(.zero, animated: true)
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
    
    func setAutoLayoutForDevice() {
        if deviceHeight == 667 {
            imageViewTopConstraint.constant = 80
            titleViewTopConstraint.constant = 20
            cardViewTopConstraint.constant = 20
            explainLabelTopConstraint.constant = 15
        }
    }
    
    func setOpenAreaHiddenView(state: Bool) {
        [openAreaExplainLabel].forEach {
            $0?.isHidden = state
        }
        [openAreaCardView, openAreaUnderBarView].forEach {
            $0?.isHidden = state
        }
        openNilLabel.isHidden = !state
    }
    
    func setBlindAreaHiddenView(state: Bool) {
        [blindAreaExplainLabel].forEach {
            $0?.isHidden = state
        }
        [blindAreaCardView, blindAreaUnderBarView].forEach {
            $0?.isHidden = state
        }
        blindNilLabel.isHidden = !state
    }
    
    
    func setInsightCardInfo() {
        if let open = openCard {
            if let imageString = open.imageURL {
                openAreaCardImageView.setImage(with: imageString)
                openAreaCardTitleLabel.text = open.title
                setOpenAreaHiddenView(state: false)
            }
            else {
                setOpenAreaHiddenView(state: true)
            }
        }
        else {
            setOpenAreaHiddenView(state: true)
        }
        
        if let blind = blindCard {
            if let imageString = blind.imageURL {
                blindAreaCardImageView.setImage(with: imageString)
                blindAreaCardTitleLabel.text = blind.title
                setBlindAreaHiddenView(state: false)
            }
            else {
                setBlindAreaHiddenView(state: true)
            }
        }
        else {
            setBlindAreaHiddenView(state: true)
        }
    }
}
