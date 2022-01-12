//
//  AddCardViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/13.
//

import UIKit

extension AddCardViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == cardContentsTextViewPlaceHolder {
            textView.text = nil
            textView.textColor = .w1
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = cardContentsTextViewPlaceHolder
            textView.textColor = .w3
            updateCountLabel(characterCount: 0)
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        guard characterCount <= 200 else { return false }
        updateCountLabel(characterCount: characterCount)

        return true
    }
}
