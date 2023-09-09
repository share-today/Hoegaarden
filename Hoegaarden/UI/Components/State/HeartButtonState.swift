//
//  LikeButtonState.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import UIKit

struct LikeButtonState {
    let isLike: Bool
    let isEnabled: Bool
    let likeButton: UIImage
    
    init(isLike: Bool, isEnabled: Bool) {
        self.isLike = isLike
        self.isEnabled = isEnabled
        self.likeButton = UIImage(named: isLike ? "heart.selected" : "heart") ?? UIImage()
    }
}
