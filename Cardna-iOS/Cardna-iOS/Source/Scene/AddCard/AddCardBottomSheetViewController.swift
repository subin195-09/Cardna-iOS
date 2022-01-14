//
//  AddCardBottomSheetViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/13.
//

import UIKit

class AddCardBottomSheetViewController: UIViewController {

    @IBOutlet weak var addCardBottomSheetView: UIView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var symbolTitleLabel: UILabel!
    @IBOutlet weak var addCardSymbolCollectionView: UICollectionView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoFromGalleryLabel: UILabel!
    
    var addCardSymbolIconList: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSymbolIconData()
        setLayout()
        setCollectionView()
    }
    
    private func setLayout() {
        setBottomSheetViewUI()
        setButtonUI()
        setLabelUI()
    }
    
    private func setBottomSheetViewUI() {
        addCardBottomSheetView.layer.cornerRadius = 24
        addCardBottomSheetView.backgroundColor = UIColor.darkGray
        addCardSymbolCollectionView.backgroundColor = UIColor.darkGray
    }
    
    private func setButtonUI() {
        completeButton.titleLabel?.font = .cardnaSh3Sbd
        completeButton.tintColor = .w1
    }
    
    private func setLabelUI() {
        [symbolTitleLabel, photoTitleLabel].forEach {
            $0?.font = .cardnaB4Sbd
            $0?.textColor = .w3
        }
        photoFromGalleryLabel.font = .cardnaB1Rg
        photoFromGalleryLabel.textColor = .w1
    }
    
    private func setCollectionView() {
        addCardSymbolCollectionView.dataSource = self
        addCardSymbolCollectionView.delegate = self
    }
    
    private func initSymbolIconData() {
        addCardSymbolIconList.append(contentsOf: [Const.Image.icbtSymbolSmile,
                                                  Const.Image.icbtSymbolHeart,
                                                  Const.Image.icbtSymbolDia,
                                                  Const.Image.icbtSymbolSpade,
                                                  Const.Image.icbtSymbolClover])
    }
}
