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
    let heartButtonState: HeartButtonState?
    let backgroundColor: BackgroundColor?
    
    init(id: String,
         dateLabel: String,
         contentLabel: String,
         heartButtonState: HeartButtonState?,
         backgroundColor: BackgroundColor?) {
        
        self.id = id
        self.dateLabel = dateLabel
        self.contentLabel = contentLabel
        self.heartButtonState = heartButtonState
        self.backgroundColor = backgroundColor
    }
}
