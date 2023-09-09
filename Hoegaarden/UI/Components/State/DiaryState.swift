//
//  DiaryState.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import Foundation

class DiaryState {
    let id: String
    let dateLabel: String
    let contentLabel: String
    let likeButtonState: LikeButtonState?
    let backgroundColor: BackgroundColor?
    
    init(id: String,
         dateLabel: String,
         contentLabel: String,
         likeButtonState: LikeButtonState?,
         backgroundColor: BackgroundColor?) {
        
        self.id = id
        self.dateLabel = dateLabel
        self.contentLabel = contentLabel
        self.likeButtonState = likeButtonState
        self.backgroundColor = backgroundColor
    }
}
