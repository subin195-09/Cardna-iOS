//
//  AddCardBottomSheetViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/13.
//

import UIKit

class AddCardBottomSheetViewController: UIViewController {
    
    // MARK: - Property
    
    var addCardSymbolSelectingList: [Bool] = [false, false, false, false, false]
    let imagePickerController = UIImagePickerController()
    var isMe = true
    
    // MARK: - IBOutlet

    @IBOutlet weak var addCardBottomSheetView: UIView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var symbolTitleLabel: UILabel!
    @IBOutlet weak var addCardSymbolCollectionView: UICollectionView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoFromGalleryLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionView()
        setImagePickerController()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        setBottomSheetViewUI()
        setButtonUI()
        setLabelUI()
    }
    
    private func setBottomSheetViewUI() {
        addCardBottomSheetView.layer.cornerRadius = 24
        addCardBottomSheetView.backgroundColor = .darkGray
        addCardSymbolCollectionView.backgroundColor = .darkGray
    }
    
    private func setButtonUI() {
        completeButton.titleLabel?.font = .cardnaSh3Sbd
        completeButton.tintColor = .w1
        completeButton.isEnabled = false
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
    
    private func setImagePickerController() {
        imagePickerController.delegate = self
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpCompletedButton(_ sender: Any) {
        let index = addCardSymbolSelectingList.firstIndex(of: true)
        var defaultImage = UIImage()
        if isMe {
            switch index {
            case 0:
                defaultImage = Const.Image.imgSymSmile
            case 1:
                defaultImage = Const.Image.imgSymHeart
            case 2:
                defaultImage = Const.Image.imgSymDia
            case 3:
                defaultImage = Const.Image.imgSymSpade
            case 4:
                defaultImage = Const.Image.imgSymClover
            default:
                break
            }
        } else {
            switch index {
            case 0:
                defaultImage = Const.Image.imgSymSmilePur
            case 1:
                defaultImage = Const.Image.imgSymHeartPur
            case 2:
                defaultImage = Const.Image.imgSymDiaPur
            case 3:
                defaultImage = Const.Image.imgSymSpadePur
            case 4:
                defaultImage = Const.Image.imgSymCloverPur
            default:
                break
            }
        }
        
        let addCardVC = presentingViewController as? AddCardViewController
        addCardVC?.cardImageView.image = defaultImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func albumBtn(_ sender: UIButton) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
}
