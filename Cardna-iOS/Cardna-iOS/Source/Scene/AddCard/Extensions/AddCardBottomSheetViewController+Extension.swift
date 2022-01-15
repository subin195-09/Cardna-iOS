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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let presentingVC = presentingViewController as? AddCardViewController
            presentingVC?.cardImageView.image = selectedImage
        }
        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
