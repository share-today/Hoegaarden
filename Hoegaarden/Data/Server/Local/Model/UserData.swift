//
//  UserData.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/14.
//

import RealmSwift

class UserData: Object {
    @objc dynamic var userId: Int = 0
    @objc dynamic var jwtToken: String = ""
    
    override static func primaryKey() -> String? {
        return "userId"
    }
}
