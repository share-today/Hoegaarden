//
//  DiaryResponse.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/31.
//

import Foundation

struct DiaryResponse: Codable {
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case content = "테스트_다이어리_내용"
    }
}
