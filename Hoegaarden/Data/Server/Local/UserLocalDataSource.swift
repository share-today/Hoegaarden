//
//  UserLocalDataSource.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/14.
//

import UIKit
import RealmSwift
import Alamofire

class UserLocalDataSource {
    
    static let shared = UserLocalDataSource()
    
    private let baseURL = "https://share-today.site"
    
    init() {
        
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
    
    func setAlert(id: Int, completion: @escaping (Result<Int, Error>) -> Void) {
        let url = "\(baseURL)/user/\(id)/alert"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            let parameters = [
                "alert": true
            ]
            
            AF.request(url,
                       method: .put,
                       parameters: parameters,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Alert Response JSON: \(value)")
                case .failure(let error):
                    print("Alert Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
