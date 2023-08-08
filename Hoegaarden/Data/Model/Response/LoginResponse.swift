//
//  LoginResponse.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/01.
//

import Foundation

struct LoginResponse: Codable {
    let sns: String
    let snsId: String
    let email: String
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case sns = "sns"
        case snsId = "snsId"
        case email = "email"
        case accessToken = "accessToken"
    }
}
