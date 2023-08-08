//
//  LoginRequest.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/01.
//

import Foundation

struct LoginRequest: Encodable {
    let sns: String
    let snsId: String
    let email: String
    let accessToken: String
}
