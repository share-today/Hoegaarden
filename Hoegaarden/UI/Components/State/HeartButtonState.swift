//
//  HeartButtonState.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import UIKit

struct HeartButtonState {
    let isLike: Bool
    let isEnabled: Bool
    let heartButton: UIImage
    
    init(isLike: Bool, isEnabled: Bool) {
        self.isLike = isLike
        self.isEnabled = isEnabled
        self.heartButton = UIImage(named: isLike ? "heart.selected" : "heart") ?? UIImage()
    }
}
