//
//  DiaryResponse.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/31.
//

import Foundation

struct DiaryResponse: Codable {
    let id: Int
    let userId: Int
    let content: String?
    let likeCount: Int
    let createdAt: String?
    let modifiedAt: String?
    let removedAt: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case content
        case likeCount = "like_count"
        case createdAt = "created_at"
        case modifiedAt = "modified_at"
        case removedAt = "removed_at"
    }
}
