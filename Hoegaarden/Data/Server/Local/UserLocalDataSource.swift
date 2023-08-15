//
//  UserLocalDataSource.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/14.
//

import Foundation
import RealmSwift

class UserLocalDataSource {
    
    static let shared = UserLocalDataSource()
    
    private init() {
        
    }
    
    func getUserJwtToken(userId: Int) -> UserData? {
        do {
            let realm = try Realm()
            return realm.object(ofType: UserData.self, forPrimaryKey: userId)
        } catch
            let error as NSError {
            print("Error: \(error.localizedDescription)")
            return nil
        }
    }
}
