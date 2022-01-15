//
//  AddCardBottomSheetViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/15.
//

import UIKit

extension AddCardBottomSheetViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func albumBtn(_ sender: UIButton) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
}
