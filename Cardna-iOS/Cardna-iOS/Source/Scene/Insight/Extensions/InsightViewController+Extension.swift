//
//  InsightViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

extension InsightViewController {
    func getInsightCard() {
        InsightService.shared.getInsight { response in
            switch response {
            case .success(let data):
                print(data)
                guard let res = data as? InsightResponse else { return }
                self.openCard = res.openAreaCard
                self.blindCard = res.blindAreaCard
                self.setInsightCardInfo()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
