//
//  LikeButtonState.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import UIKit

struct LikeButtonState {
    var isLike: Bool
    let isEnabled: Bool
    
    mutating func toggle() {
        isLike.toggle()
    }
    
    var image: UIImage {
        return UIImage(named: isLike ? "heart.selected" : "heart") ?? UIImage()
    }
    
    init(isLike: Bool, isEnabled: Bool) {
        self.isLike = isLike
        self.isEnabled = isEnabled
    }
}
